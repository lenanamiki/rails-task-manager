ActiveRecord::Schema.define(version: 2021_05_18_023354) do

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
