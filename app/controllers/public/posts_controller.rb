class Public::PostsController < ApplicationController
 before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end
end