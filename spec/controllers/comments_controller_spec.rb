require 'spec_helper'
 
describe CommentsController do
  let(:user) { create :user }
  
  before { sign_in user}
  
  context 'when there is a post' do
    let(:my_post) { create :post }

    describe 'POST #create' do
      it "redirects to the post's :show view" do
        post :create, { post_id: my_post.id, comment: { commenter: 'Concerned Person', body: 'Great Post!' } }
        expect(response).to redirect_to post_path(my_post)
      end
    end
    
    context 'with a comment' do
      let(:comment) { create :comment, post: my_post, user: user }

      describe 'DELETE #destroy' do
        it "redirects to the post's :show view" do
          delete :destroy, post_id: my_post.id, id: comment.id
          expect(response).to redirect_to post_path(my_post)
        end
      end
    end
  end
end