class AddPairToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :follower_id, :integer
    add_column :rooms, :followable_id, :integer
  end
end
