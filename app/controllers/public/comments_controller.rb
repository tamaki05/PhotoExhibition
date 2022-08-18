class Public::CommentsController < ApplicationController

  def create

    @exhibition = Exhibition.find(params[:exhibition_id])
    comment = current_user.comments.new(comment_params)
    comment.exhibition_id = @exhibition.id
    comment.save
    @comment = Comment.new
  end

  def destroy
    Comment.find(params[:id]).destroy
    @exhibition = Exhibition.find(params[:exhibition_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
