class UsersController < ApplicationController 
  before_action :forbid_login_user, {only: [:create, :login]}
  
  def create
    @user = User.new(user_params)
      if @user.save
       session[:user_id] = @user.id
       flash[:success] = "User registration completed"
       redirect_to posts_path
      else
       flash[:error] = "Email or username already registered"
       render 'home/top'
      end
  end 

  def posts
    @user = User.find(params[:id])
    @current_user_posts = @user.posts.page(params[:page]).per(4).order(created_at: :desc)
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts.page(params[:page]).per(4).order(created_at: :desc)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
      @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to posts_path, notice: "Update succeeded"
    else
      render :edit
    end
  end

  def login
      @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Login succeeded"
    else
      flash[:error] = "The entered email or password has not been registered"
      render 'home/top'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You were logged out"
    redirect_to root_path
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :image_name)
  end

end
