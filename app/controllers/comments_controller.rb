class CommentsController < ApplicationController
  # load_and_authorize_resource
  def load_and_authorize_resource
    load_resource
    authorize_resource
  end

  def create
    @post = Post.includes(:user).find_by(params[:post_id])
    @post = Post.find_by(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'New Comment created successfully'
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = 'An error occurred : Comment could not be created'
    end
  end

  # def new
  #   @comment = Comment.create(params)
  # end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
