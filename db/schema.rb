# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_15_051051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "player"
    t.string "team"
    t.string "position", limit: 2
    t.integer "rushing_attempts"
    t.decimal "rushing_attempts_per_game"
    t.integer "total_rushing_yards"
    t.decimal "rushing_average_yards_per_attempt"
    t.decimal "rushing_yards_per_game"
    t.integer "touchdowns"
    t.integer "longest_rush"
    t.boolean "longest_rush_has_touchdown"
    t.integer "rushing_first_downs"
    t.decimal "rushing_first_down_percentage"
    t.integer "rushing_twenty_or_more_yards_each"
    t.integer "rushing_forty_or_more_yards_each"
    t.integer "rushing_fumbles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
