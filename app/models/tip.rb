class Tip < ApplicationRecord
  belongs_to :user 
  belongs_to :lesson_topic

  validates :name, presence: true 
  validates :description, presence: true 
  validates :user_id, presence: true 
  validates :lesson_topic_id, presence: true 
  validates :link, presence: true 
  validates :lesson_outcome, presence: true 

end
