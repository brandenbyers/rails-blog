class PostsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(params[:post].permit(:title, :text))
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
end