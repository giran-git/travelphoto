class Users::RelationshipsController < ApplicationController
   before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    @url = request.referer
    redirect_to @url
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    @url = request.referer
    redirect_to @url
  end
end

