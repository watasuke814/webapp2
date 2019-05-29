class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def create
        @user = User.new(name: params[:name],email: params[:email])
        @user.save
        redirect_to("/users/#{@user.id}")
    end 
end
