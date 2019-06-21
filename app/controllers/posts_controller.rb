class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.page(params[:page]).per(4).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to posts_path
    else
      @posts = Post.page(params[:page]).per(4).order(created_at: :desc)
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:image_name,:content,:user_id)
  end

end
