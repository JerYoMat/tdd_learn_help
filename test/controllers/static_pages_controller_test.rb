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

  
end
