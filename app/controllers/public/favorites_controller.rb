class Public::FavoritesController < ApplicationController
  before_action :set_post


  def create
   @favorite = Favorite.new(customer_id: current_customer.id,  post_id: @post.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, post_id:  @post.id)
    @favorite.destroy
  end


  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end
