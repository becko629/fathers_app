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


  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
