# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController

  before_action :reject_customer, only: [:create]
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
  end

  #ゲストユーザー
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
