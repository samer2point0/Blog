class CommentsController < ApplicationController

  def create
    @comment=Comment.new(comment_params)
    @comment.article_id=params[:article_id]
    @comment.user_id=current_user.id
    if !@comment.save
      debugger
    end
    redirect_to article_path(@comment.article_id)
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
