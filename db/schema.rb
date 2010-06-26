# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100626093144) do

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.date     "dob"
    t.integer  "age"
    t.boolean  "gender"
    t.string   "mobile"
    t.text     "address"
    t.binary   "photo"
    t.string   "role",                        :default => "others"
    t.integer  "order_by"
    t.string   "relationship"
    t.string   "comment",                     :default => "No feedback"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qualification", :limit => 50
    t.string   "occupation",    :limit => 50
    t.boolean  "status",                      :default => true
    t.boolean  "hr_status",                   :default => false
    t.integer  "language_id"
    t.text     "company"
  end

end
