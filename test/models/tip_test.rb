require 'test_helper'

class TipTest < ActiveSupport::TestCase

  def setup 
    @tip1 = tips(:test_tip_1)
    @tip2 = tips(:test_tip_2)
    @user1 = users(:test_user_michael)
    @lesson_topic1= lesson_topics(:test_lesson_topic_1)
  end 

  test 'should be valid' do 
    assert @tip1.valid?
  end 

  test 'tip belongs to a user' do 
    @tip1.user_id = nil 
    assert_not @tip1.save, 'Tip should not save without user'
  end 

  test 'tip belongs to a lesson_topic' do 
    @tip1.lesson_topic_id = nil 
    assert_not @tip1.save, 'Tip should not save without Lesson Topic'
  end 

  test 'tip has a name' do 
    @tip1.name = nil 
    assert_not @tip1.save, 'Tip should not save without name'
 
  end 

  test 'tip has a description' do 
    @tip1.description = nil 
    assert_not @tip1.save, 'Tip should not save without description'
  end 

  test 'tip has a link' do 
    @tip1.link = nil 
    assert_not @tip1.save, 'Tip should not save without link'
    @tip1.link =  'www.something.com'
    assert @tip1.save, 'Tip should save with Link'
  end 

  test 'tip has lesson_outcome' do 
    @tip1.lesson_outcome = nil 
    assert_not @tip1.save, 'Tip should not save without lesson_outcome'
  end 


end
