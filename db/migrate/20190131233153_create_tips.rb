class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.string :name
      t.text :description 
      t.string :link 
      t.belongs_to :lesson_topic
      t.belongs_to :user 
      t.timestamps
    end
    add_index :tips, [:user_id, :created_at]
  end
end
