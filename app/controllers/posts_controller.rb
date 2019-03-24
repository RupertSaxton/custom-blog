class PostsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def all
    @posts = Post.all.by_date_created.limit(2)
  end

  def index
    @posts = Post.all.by_date_created
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge({user_id: current_user.id}))
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
