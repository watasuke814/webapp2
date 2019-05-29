class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def create
        @user = User.new(name: params[:name],email: params[:email])
       if @user.save
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/users/#{@user.id}")
       end
    end 
end
