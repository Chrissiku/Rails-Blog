class PostsController < ApplicationController
  # load_and_authorize_resource
  def load_and_authorize_resource
    load_resource
    authorize_resource
  end

  def index
    @user = User.find_by(id: params.require(:user_id))
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.find_by(id: params.require(:user_id))
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'New Post created successfully'
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'An error occurred : Post could not be created'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
