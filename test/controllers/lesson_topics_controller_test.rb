require 'test_helper'

class LessonTopicsControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @lesson_topic = lesson_topics(:test_lesson_topic_1)
  end 
  
  test 'index is available' do 
    get lesson_topics_path
    assert_response :success 
  end 

  test 'show is available' do 
    get lesson_topic_path(@lesson_topic)
    assert_response :success
  end 
end
