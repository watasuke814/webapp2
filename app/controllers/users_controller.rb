class UsersController < ApplicationController 

    def create
    @user = User.new(user_params)
       if @user.save
        session[:user_id] = @user.id
        flash[:success] = "ユーザー登録が完了しました"
        redirect_to posts_path
       else
        flash[:error] = "emailかユーザ名がすでに登録されています"
        redirect_to root_path
       end
    end 

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
          redirect_to posts_path, notice: "ユーザー情報を編集しました。"
        else
          render :edit
        end
    end

    def login
        @user = User.find_by(email: params[:email], password: params[:password])
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/posts")
      else
        flash[:notice] = "emailまたはpasswordが違います"
        redirect_to("/")
    end
  end

    def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
    end

    private
    def user_params
      params.require(:user).permit(:name,:email,:password,:image_name)
    end

end
