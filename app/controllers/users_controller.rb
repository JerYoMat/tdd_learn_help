class UsersController < ApplicationController
    before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    
    def new
        @user = User.new 
    end 
  
    def create 
    end 
  
    def edit 
    end
  
    def update 
    end 
  
    def index 
    end 
  
    def show 
    end 
  
    def destroy 
    end 

private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :has_graduated)
  end

end
