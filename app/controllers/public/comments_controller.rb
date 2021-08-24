class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    f_params = comment_params
    @post = Post.find(params[:post_id])
		@comment = Comment.new()
		@comment.comment = f_params[:comment_text]
		@comment.post_id = @post.id
		@comment.customer_id = current_customer.id
		@comment.save
		redirect_to post_path(@post)
  end

  def destroy
		@post = Post.find(params[:post_id])
  	comment = @post.comments.find(params[:id])
		comment.destroy
		redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
