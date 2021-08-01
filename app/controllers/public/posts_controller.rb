class Public::PostsController < ApplicationController
before_action :authenticate_customer!
  # before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
   @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer_id)
    #コメント機能
    @comments = @post.comments
    @comment = current_customer.comments.new

  end

  def create
   @post = Post.new(post_params)
   @post.customer_id = current_customer.id
   @post.genre_id = Post.post_areas[params[:post][:genre_id]]
   @post.location_id = Post.location_areas[params[:post][:location_id]]
    if @post.save!
      redirect_to users_path, notice: "投稿完了しました"
    else
      flash.now[:alert] = '投稿内容を入力してください。'
      render :index
    end
  end
  def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to request.referer
  end

  private
 def post_params
  params.require(:post).permit(:post_content, :title, :body, :image, :name, :post_area, :text, :genre_id, :location_id)
 end
end
