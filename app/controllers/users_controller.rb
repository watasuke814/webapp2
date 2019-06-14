class UsersController < ApplicationController 

    def create
    @user = User.new(user_params)
       if @user.save
        session[:user_id] = @user.id
        flash[:success] = "ユーザー登録が完了しました"
        redirect_to posts_path
       else
        flash[:error] = "emailかユーザ名がすでに登録されています"
        render 'home/top'
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
        redirect_to posts_path, notice: "ログインしました"
      else
        flash[:error] = "入力されたemailまたはpasswordが登録されていません"
        render 'home/top'
    end
  end

    def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to root_path
    end

    private
    def user_params
      params.require(:user).permit(:name,:email,:password,:image_name)
    end

end
