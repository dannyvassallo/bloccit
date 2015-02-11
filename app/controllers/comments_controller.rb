class CommentsController < ApplicationController
  repond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment posted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:error] = "Error deleting comment. Please try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(:post_id => params[:post_id])
  end

end
