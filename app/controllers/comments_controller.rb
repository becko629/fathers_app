class CommentsController < ApplicationController

  before_action :authenticate_user!, except:[:index]

  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
