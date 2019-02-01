require 'test_helper'

class LessonTopicTest < ActiveSupport::TestCase
  def setup 
    @lesson = LessonTopics(:test_lesson_topic_1)
    @other_lesson = LessonTopics(:test_lesson_topic_2)
  end 

  test 'should be valid' do
    assert @lesson.valid?, 'everything else will fail if this does not pass.  Check you fixtures and setup'
  end 

  test 'should have a name' do 
     @lesson.name = nil 
     assert_not @lesson.save, 'lesson should require name'
     @lesson.name = 'test name'
     assert @lesson.save, 'lesson should save with name'
  end 

  test 'should have a description' do
    @lesson.description = nil 
    assert_not @lesson.save, 'lesson should require description'
    @lesson.description = @other_lesson.description
    assert @lesson.save, 'lesson should save with description'
  end 
  
  test 'should have a course_order' do 
    @lesson.course_order = nil 
    assert_not @lesson.save, 'lesson should require course order'
    @lesson.course_order = 1
    assert @lesson.save 
  end 
end
