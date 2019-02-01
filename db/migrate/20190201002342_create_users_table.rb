class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tables do |t|
      t.string :name 
      t.string :email 
      t.string :password_digest 
      t.boolean :has_graduated
      t.timestamps
    end
  end
end
