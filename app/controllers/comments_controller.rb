class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment posted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(:post_id => params[:post_id])
  end

end