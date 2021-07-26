class Public::UsersController < ApplicationController
  # before_action :set_user, only: [:show]

def show
  @user = Customer.find(params[:id])
  @customer = current_customer
  @posts = @user.posts
  @post = Post.new
  # @relationship = current_customer.relationships.find_by(follow_id: @customer.id)
  # @set_relationship = current_customer.relationships.new
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