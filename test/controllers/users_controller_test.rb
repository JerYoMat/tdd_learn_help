require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:test_user_michael)
    @user2 = users(:test_user_angelo)
   end 
   
  test 'validate that users that non-authenticated users cannot see index page' do 
    get users_path 
    assert_redirected_to login_url
  end 
 
   
   test "should get new" do
     get signup_path
     assert_response :success
   end
 
   test "ensure that the wrong user is redirected when trying to navigate to edit" do 
     log_in_as(@user2)
     get edit_user_path(@user1)
     assert flash.empty?
     assert_redirected_to root_url
   end 

   test 'only owning user can delete themselves' do 
    assert_no_difference 'User.count' do
        delete user_path(@user1)
    end
    assert_redirected_to root_path
    log_in_as(@user1)
    assert_no_difference 'User.count' do
        delete user_path(@user2)
    end
    assert_redirected_to root_path
    log_in_as(@user1)
    assert_difference 'User.count' do
        delete tip_path(@user1)
    end
    assert_redirected_to root_path
  end 




end
