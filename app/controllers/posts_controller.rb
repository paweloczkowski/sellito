class PostsController < ApplicationController
  before_action :fetch_post, only: [:show, :edit, :update, :destroy]
  # before_action :fetch_post, only: %i(show edit update destroy)

  def index
    @posts = Post.all.reverse
  end

  def user_posts
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    return unless post_params[:user_id] == current_user.id.to_s
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to @post
    else
      flash[:alert] = 'Could not create post'
       redirect_back(fallback_location: root_path)
    end
  end

  def show; end

  def edit; end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    flash[:notice] = "Post #{@post.title} deleted"
    redirect_to posts_path
  end

 private

  def fetch_post
    @post = Post.find(params[:id])
  end

  def post_params
   params.require(:post).permit(:title, :description, :expiration_date, :user_id)
  end
end
