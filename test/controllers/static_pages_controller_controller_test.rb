require 'test_helper'

class StaticPagesControllerControllerTest < ActionDispatch::IntegrationTest
 

  test 'home page is accessible' do 
    get root_path 
    assert_response :success, "yes"
  end 

  test 'about page is accessible' do 
    get about_path
    assert_response :success
  end 

end
