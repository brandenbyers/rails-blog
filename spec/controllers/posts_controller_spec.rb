require 'spec_helper'

describe PostsController do
  
  describe 'GET #new' do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end
  
  describe 'POST #create' do
    it "redirects to the :show view" do
      post :create, post: { title: 'title', text: 'text' }
      expect(response).to redirect_to assigns[:post]
    end
  end
  
  describe 'GET #index' do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end
  
end