class UsersController < ApplicationController 
    def show 
        @user = current_user.all
    end 
end 