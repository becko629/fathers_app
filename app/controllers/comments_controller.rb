class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @post = params[:post_id]
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post.id}"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    return unless current_user.id != @comment.user_id
    redirect_to "/posts/#{@comment.post.id}"
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
