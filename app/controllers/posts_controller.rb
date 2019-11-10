class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
    p @posts
  end

  def new
    # if params[:user_id] 
    #   @wall_id = params[:user_id]
    # else 
    #   @wall_id = current_user.id
    # end
    @post = current_user.posts.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end

end
