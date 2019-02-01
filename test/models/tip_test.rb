require 'test_helper'

class TipTest < ActiveSupport::TestCase

  def setup 
    @tip1 = Tips(:test_tip_1)
    @tip2 = Tips(:test_tip_2)
    @user1 = Users(:test_user_1)
    @lesson_topic1= LessonTopics(:test_lesson_topic_1)
  end 

  test 'should be valid' do 
    assert @tip.valid?
  end 

  test 'tip belongs to a user' do 
    @tip1.user_id = nil 
    assert_not @tip1.save, 'Tip should not save without user'
    @tip2.user_id = @user1.id
    assert @tip2.save, 'Tip should save with a user'
  end 

  test 'tip belongs to a lesson_topic' do 
    @tip1.lesson_topic_id = nil 
    assert_not @tip1.save, 'Tip should not save without Lesson Topic'
    @tip2.lesson_topic_id = @lesson_topic1.id
    assert @tip2.save, 'Tip should save with Lesson Topic'
  end 

  test 'tip has a name' do 
    @tip1.name = nil 
    assert_not @tip1.save, 'Tip should not save without name'
    @tip2.name = 'Test NAme'
    assert @tip2.save, 'Tip should save with name'
  end 

  test 'tip has a description' do 
    @tip1.description = nil 
    assert_not @tip1.save, 'Tip should not save without description'
    @tip1.description = @tip2.description
    assert @tip1.save, 'Tip should save with description'
  end 

  test 'tip has a link' do 
    @tip1.link = nil 
    assert_not @tip1.save, 'Tip should not save without link'
    @tip1.link =  @tip2.link
    assert @tip1.save, 'Tip should save with Lesson Topic'
  end 

  test 'tip has lesson_outcome' do 
    @tip1.lesson_outcome = nil 
    assert_not @tip1.save, 'Tip should not save without lesson_outcome'
    @tip1.lesson_outcome = @tip2.lesson_outcome
    assert @tip1.save, 'Tip should save with lesson_outcome'
  end 


end
