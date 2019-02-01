require 'test_helper'

class StaticPagesControllerControllerTest < ActionDispatch::IntegrationTest
 
#Pages available to anyone return a 200 status code 
  test 'home page is accessible' do 
    get root_path 
    assert_response :success
  end 

  test "should get lessons index page" do
    get lesson_topics_page
    assert_response :success
    assert_select "title", "Lesson Topics"
  end




end
