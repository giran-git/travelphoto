class User::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @book_comment = BookComment.new
  end
end
