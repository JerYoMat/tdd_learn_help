require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
def setup 
  @user = users(:test_user_michael)
end 

test " layout when not logged in" do
  get root_path
  assert_template 'static_pages/home'
  assert_select "a[href=?]", root_path
  assert_select "a[href=?]", lessons_path  
  assert_select "a[href=?]", login_path
  assert_select "h1", "Welcome to LearnHELP"
  
  assert_select "a", "Sign in with Facebook"
  assert_select "a", "Sign in with Github"
  assert_select "a", "Sign up now!"
end

test "layout when logged in" do 
  get root_path
  log_in_as(@user)
  assert_select "a[href=?]", root_path
  assert_select "a[href=?]", lessons_path
  assert_select "a[href=?]", users_path
  assert_select "a[href=?]", user_path(@user)
  assert_select "a[href=?]", edit_user_path(@user)
  assert_select "a[href=?]", logout_path
end 


end 