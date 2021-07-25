class Public::RelationshipsController < ApplicationController
   before_action :authenticate_user!

  def create
    following = current_customer.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @customer
    end
  end

  def destroy
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @customer
    end
  end

  private
  def
    @customer = Customer.find(params[:relationship][:follow_id])
  end

  #————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end