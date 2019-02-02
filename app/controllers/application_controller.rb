class ApplicationController < ActionController::Base
  
    include SessionsHelper 
  
  def logged_in_user
    unless logged_in?
      store_location 
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def set_user
    @user = User.find(params[:id])
  end 

  def correct_user 
    set_user
    redirect_to root_url unless @user == current_user
  end 

end
