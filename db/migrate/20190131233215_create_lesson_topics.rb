class CreateLessonTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_topics do |t|

      t.timestamps
    end
  end
end
