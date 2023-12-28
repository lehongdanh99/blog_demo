class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  def create

    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "comment successfully created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong"
      redirect_to post_path(@post)
    end
  end
  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
      format.html { redirect_to post_url(@post), notice: 'Comment has been updated sucessfully' }
      else
      format.html { redirect_to post_url(@post), notice: 'Comment was not updated' }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "comment successfully destroyed"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong"
      redirect_to post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
