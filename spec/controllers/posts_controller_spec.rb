require 'spec_helper'

describe PostsController do
  
  include AuthHelper
 
  before(:each) do
    http_login
  end
  
  describe 'GET #new' do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end
  
  context 'when there is a post' do
    let(:post) { create :post }

    describe 'GET #edit' do
      it "returns http success" do
       get :edit, id: post.id
       expect(response).to be_success
      end
    end

    describe 'PATCH #update' do
      context 'when the post is valid' do
        it "redirects to the :show view" do
          patch :update, id: post.id, post: { title: 'change it' }
          expect(response).to redirect_to post_path(post)
        end
      end
      
      context 'when the post is not valid' do
        it "renders the :new view" do
          patch :update, id: post.id, post: { title: '' }
          expect(response).to render_template :edit
        end
      end
    end
    
    describe 'DELETE #destroy' do
      it "redirects to the :index view" do
        delete :destroy, id: post.id
        expect(response).to redirect_to posts_path
      end
    end
  end
    
  describe 'POST #create' do
    context 'when the post is valid' do
      it "redirects to the :show view" do
        post :create, post: { title: 'title', text: 'text' }
        expect(response).to redirect_to assigns[:post]
      end
    end
    
    context 'when the post is not valid' do
      it "renders the :new view" do
        post :create, post: { title: '', text: 'text' }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'GET #index' do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    
    it "assigns @posts to Post.all" do
      get :index
      expect(assigns[:posts]).to eq Post.all
    end
  end
end