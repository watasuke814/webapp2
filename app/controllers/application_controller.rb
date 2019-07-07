class ApplicationController < ActionController::Base
  before_action :set_current_user, :set_search
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:error] = "You were not login"
      redirect_to root_path
    end
  end

  def forbid_login_user
    if @current_user
      flash[:error] = "You are already logged in"
      redirect_to posts_path
    end
  end

  def set_search
    @search = Post.ransack(params[:q]) 
    @search_posts = @search.result.page(params[:page]).per(4).order(created_at: :desc)
  end
end
