class LessonTopic < ApplicationRecord
   has_many :tips 
   has_many :users, through: :tips
   
   validates :name, presence: true 
   validates :description, presence: true 
   validates :course_order, presence: true  
end
