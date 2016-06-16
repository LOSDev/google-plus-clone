class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render 'show'
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
