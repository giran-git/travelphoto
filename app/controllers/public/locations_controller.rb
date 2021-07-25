class Public::LocationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @Posts = Post.all
  end
  def new
    @location = Location.new
  end


end
