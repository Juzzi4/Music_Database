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

ActiveRecord::Schema.define(version: 2020_08_25_185802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "musics", force: :cascade do |t|
    t.string "instrument"
    t.string "title"
    t.string "composer"
    t.string "arranger"
    t.string "publisher"
    t.integer "difficulty"
  end

  create_table "user_musics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "music_id"
    t.boolean "is_liked"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password"
    t.string "instrument"
  end

end
