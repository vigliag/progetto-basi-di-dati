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

ActiveRecord::Schema.define(version: 20140622082506) do

  create_table "admin_movies", force: true do |t|
    t.string   "title"
    t.integer  "length"
    t.integer  "year"
    t.text     "description"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "length"
    t.integer  "year"
    t.text     "description"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "purchases", force: true do |t|
    t.string   "name"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screens", force: true do |t|
    t.boolean  "avaiable"
    t.text     "seats_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.integer  "movie_id"
    t.datetime "start"
    t.integer  "screen_id"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "show_id"
    t.string   "seat"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
