require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:test_user_michael)
  end 
  
  test 'should get new' do 
    get login_path 
    assert_response :success
    assert_select "title", "Log In"
  end 

  test 'after logging out user goes to root' do 
    log_in_as(@user)
    get root_path 
    delete logout_path 
    assert_redirected_to root_path, 'users that log out should be redirected to home'
  end 

end
