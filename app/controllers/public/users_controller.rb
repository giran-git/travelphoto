class Public::UsersController < ApplicationController
  # before_action :set_user, only: [:show]

def show
   @user = Customer.find(params[:id])
   @posts = @user.posts
   @post = Post.new
end

def index
  @customer = current_customer
  @posts = @customer.posts
end

private

  # def set_user
  #   @user = Customer.find(params[:id])
  # end
end