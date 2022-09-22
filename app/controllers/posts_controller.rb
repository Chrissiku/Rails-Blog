class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @posts = Post.where(@user.find(find(params[:id])))
    # @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end
