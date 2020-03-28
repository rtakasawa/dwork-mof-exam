class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :house_name, null: false
      t.float :rent, null: false
      t.string :house_address, null: false
      t.integer :house_age, null: false
      t.text :remarks
      t.timestamps
    end
  end
end
