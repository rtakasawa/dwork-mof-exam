ActiveRecord::Schema.define(version: 2020_03_27_012913) do

  create_table "houses", force: :cascade do |t|
    t.string "house_name", null: false
    t.float "rent", null: false
    t.string "house_address", null: false
    t.integer "house_age", null: false
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.text "line"
    t.text "station_name"
    t.integer "minutes_on_foot"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_stations_on_house_id"
  end

end
