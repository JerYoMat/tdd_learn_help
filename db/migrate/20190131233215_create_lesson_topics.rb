class CreateLessonTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_topics do |t|
      t.string :name 
      t.text :description 
      t.integer :course_order
      t.timestamps
    end
  end
end
