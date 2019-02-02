class UsersController < ApplicationController
    before_action :logged_in_user, only: [:create, :edit, :update, :index]
    before_action :correct_user, only: [:edit, :update]
    
    
    def new
        @user = User.new 
      end
    
    def show     
      set_user
    end 
    
    def create
    @user = User.new(user_params)
      if @user.save 
        log_in(@user)
        flash[:success] = "welcome to LearnHELP"
        redirect_to @user 
      else 
        render 'new'
      end 
    end 

    def edit 
    end 
    
    def update
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end 
    end 

    def index 
      @users = User.all 
    end 

    def destroy 
      @user = User.find(params[:id])
  
      if @user.id == session[:user_id]
       User.delete(@user.id)
      end 
        redirect_to root_path 
    end 

private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :has_graduated)
  end

end
