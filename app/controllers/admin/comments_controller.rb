class Admin::CommentsController < ApplicationController

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_admin_user_path
  end

end
