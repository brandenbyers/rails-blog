class PostsController < ApplicationController
  def new
  end
  
  def create
    @post = Post.new(params[:post].permit(:title, :text))
    
    @post.save
    redirect_to @post
  end
  
  def show
    @posts = Post.find(params[:id])
  end
end