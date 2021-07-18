class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show]

def show
   @user = Customer.find(params[:id])
end

def index
  @customer = current_customer
  @customers = Customer.all
end

private

  def set_user
    @user = Customer.find([:id])
  end
end