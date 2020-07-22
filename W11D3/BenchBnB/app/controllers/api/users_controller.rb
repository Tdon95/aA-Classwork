class Api::UsersController < ApplicationController 
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status:422
        end
    end
    
    private
    def users_params
        params.require(:user).permit(:username, :password)
    end
end