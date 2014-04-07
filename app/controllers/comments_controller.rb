class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    @comment.user = current_user
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    current_user.comments.where(post_id: params[:post_id], id: params[:id]).destroy_all
    redirect_to post_path(@post)
  end
end