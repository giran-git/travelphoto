class Public::LocationsController < ApplicationController
  def index
    @Posts = Post.all
  end
  
end
