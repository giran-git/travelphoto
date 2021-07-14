class Users::LocationsController < ApplicationController
  def index
    @Posts = Post.all
  end
end
