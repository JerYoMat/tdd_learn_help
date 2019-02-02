require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @tip = tips(:test_tip_1)
    @owning_user = users(:test_user_michael)
    @other_user = users(:test_user_angelo) 
  end 
  
  test 'should redirect create when not logged in' do 
    get new_tip_path
    assert_no_difference 'Tip.count' do
      post tips_path, params: { tip: { 
        name: "Test Name",
        lesson_topic_id: 1,
        user_id: 1,    
        description: "Lorem ipsum",
        lesson_outcome: "really helped with Y"
         } }
    end
    assert_redirected_to login_url
  end 

  test 'should create a new tip when logged in' do 
     log_in_as(@owning_user)
     get new_tip_path
     assert_difference 'Tip.count' do
        post tips_path, params: { tip: { 
          name: "Test Name",
          lesson_topic_id: 1,
          link: "www.something.com",
          user_id: @owning_user.id,    
          description: "Lorem ipsum",
          lesson_outcome: "really helped with Y"
           } }
      end
  
  end 

  test 'should redirect edit when not logged in or owning user' do 
     get edit_tip_path(@tip)
     assert_redirected_to login_path, "logged in user should not be able to access"
     log_in_as(@other_user)
     get edit_tip_path(@tip)
     assert_redirected_to root_path "User should not be able to edit tip not belonging to them"
  end 

  test 'owning user should be able to edit tip' do 
    log_in_as(@owning_user)
    get edit_tip_path(@tip)
    assert_response :success 
  end 

  test 'only owning user can delete tip' do 
    get tip_path(@tip)
    assert_no_difference 'Tip.count' do
        delete tip_path(@tip)
    end
    
    
    log_in_as(@other_user)
    assert_no_difference 'Tip.count' do
        delete tip_path(@tip)
    end
    log_in_as(@owning_user)
    assert_difference 'Tip.count' do
        delete tip_path(@tip)
    end
  
  end 

  test 'show is available to all users' do 
    get tip_path(@tip)
    assert_response :success  
  end 

  test 'index is available to all users' do 
    get tips_path
    assert_response :success
  end 


end
