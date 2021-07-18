class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
      if @genre.save
        flash[:success] = "登録に成功しました"
        redirect_to admin_genres_path
      else
        flash[:warning] = "入力内容を確認してください"
        @genres = Genre.all
  		    render 'index'
  	  end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:success] = "編集に成功しました"
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_enabled)
  end
end
