class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post =Post.find(params[:id])
    return unless current_user.id != @post.user_id
    redirect_to root_path
  end

  def update
    @post =Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    return unless current_user.id == @post.user_id
    
    @post.destroy
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :text, :category_id, :prefecture_id, :image).merge(user_id: current_user.id)

  end
end
