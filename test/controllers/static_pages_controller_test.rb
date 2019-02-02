require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user_michael)
  end 

  test 'should get home' do 
    get root_path 
    assert_response :success 
    assert_select "title", "Home"
    
  end 

  test 'A logged in user should not see an option to sign up' do 
    log_in_as(@user)
    get root_path
    !assert_select 'button li', "Sign up now!"
  end 
end
