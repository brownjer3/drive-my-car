# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20201211190302) do

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.date     "end_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.boolean  "public",         default: true, null: false
    t.string   "car_make"
    t.string   "car_model"
    t.integer  "car_year"
    t.integer  "origin_id"
    t.integer  "destination_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "location_id"
  end

end
