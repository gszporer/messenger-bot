class AddIndexToTodo < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :psid, unique: true
  end
end
