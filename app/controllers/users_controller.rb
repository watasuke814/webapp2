class UsersController < ApplicationController 

    def create
    @user = User.new(name: params[:name],
                     email: params[:email],
                     image_name: "default_user.jpg",
                     password: params[:password]
                    )
       if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/posts")
       end
    end 

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
      if @user.save
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to("/posts")
      else
        render("users/edit")
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
        render("/")
      end
    end

    def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
    end

end
