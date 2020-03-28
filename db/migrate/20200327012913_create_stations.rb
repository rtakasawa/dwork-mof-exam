class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.text :line
      t.text :station_name
      t.integer :minutes_on_foot
      t.references :house, foreign_key: true
      t.timestamps
    end
  end
end
