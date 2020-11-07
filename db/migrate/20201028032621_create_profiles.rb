class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :introduction
      t.string :image
      t.string :age
      t.string :price
      t.string :nickname
      t.integer :sex
      t.timestamps
    end
  end
end
