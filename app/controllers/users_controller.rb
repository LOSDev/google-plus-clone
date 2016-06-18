class UsersController < ApplicationController

  before_action :find_user, only: [:show, :posts]

  def show
    render json: @user
  end

  def posts
    @posts = @user.posts
    render 'posts/index'
  end

  private

  def find_user
    @user = User.find_by_username(params[:id])
  end
end
