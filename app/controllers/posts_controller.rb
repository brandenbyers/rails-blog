class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post].permit(:title, :text))
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @posts = Post.find(params[:id])
  end
end