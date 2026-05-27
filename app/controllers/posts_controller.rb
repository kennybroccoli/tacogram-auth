class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to post."
      return
    end
    @post = Post.new
  end

  def create
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to post."
      return
    end

    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created."
    else
      flash[:notice] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def post_params
    params.permit(:body, :image)
  end
end