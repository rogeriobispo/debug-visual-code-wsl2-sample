# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_14_214926) do

  create_table "dog_walkings", force: :cascade do |t|
    t.integer "status", default: 0
    t.integer "person_id"
    t.datetime "scheduled_date"
    t.decimal "price"
    t.string "duration"
    t.string "latitude"
    t.string "longitude"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_dog_walkings_on_person_id"
  end

  create_table "dog_walkings_pets", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "dog_walking_id"
    t.index ["dog_walking_id"], name: "index_dog_walkings_pets_on_dog_walking_id"
    t.index ["pet_id"], name: "index_dog_walkings_pets_on_pet_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.integer "person_id"
    t.string "recomendation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_pets_on_person_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "duration"
    t.decimal "unitary_price"
    t.decimal "aditional_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
