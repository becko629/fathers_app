class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :category_id, :prefecture_id, :image).merge(user_id: current_user.id)

  end
end
