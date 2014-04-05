require 'spec_helper'
 
describe CommentsController do
  context 'when there is a post' do
    let(:my_post) { create :post }

    describe 'POST #create' do
      it "redirects to the post's :show view" do
        post :create, { post_id: my_post.id, comment: { commenter: 'Concerned Person', body: 'Great Post!' } }
        expect(response).to redirect_to post_path(my_post)
      end
    end
  end
end