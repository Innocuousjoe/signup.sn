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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120201191216) do

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "sex"
    t.string   "sex_seeking"
    t.integer  "birthday_month"
    t.integer  "birthday_day"
    t.integer  "birthday_year"
    t.string   "country"
    t.integer  "zipcode"
    t.string   "captcha_key"
    t.string   "captcha_answer"
    t.integer  "height"
    t.integer  "body"
    t.integer  "hair"
    t.integer  "eye"
    t.integer  "race"
    t.integer  "occupation"
    t.integer  "drink"
    t.integer  "smoke"
    t.integer  "about"
    t.integer  "city_id"
    t.string   "core_key"
    t.string   "redirect_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
