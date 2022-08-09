class Public::CommentsController < ApplicationController

  def create
    @comment = Comment.new
    exhibition = Exhibition.find(params[:exhibition_id])
    comment = current_user.comments.new(comment_params)
    comment.exhibition_id = exhibition.id
    comment.save
    redirect_to comments_exhibition_path(exhibition.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    exhibition = Exhibition.find(params[:exhibition_id])
    redirect_to comments_exhibition_path(exhibition.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
