class Public::LocationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @Posts = Post.all
  end

end
