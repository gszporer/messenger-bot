class CreateToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.text :item
      t.integer :user_id

      t.timestamps
    end
  end
end
