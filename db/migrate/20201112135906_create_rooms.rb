class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :rooms, :updated_at
  end
end
