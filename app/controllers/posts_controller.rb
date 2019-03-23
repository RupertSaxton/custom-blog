class PostsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def all

  end

  def index
    @posts = Post.all.sort_by { |post| post.created_at }
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
