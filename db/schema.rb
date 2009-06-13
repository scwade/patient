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

ActiveRecord::Schema.define(:version => 20090613045403) do

  create_table "patient_profiles", :force => true do |t|
    t.integer  "patient_id", :null => false
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "province"
    t.string   "country"
    t.datetime "created_on", :null => false
    t.datetime "updated_on", :null => false
  end

end
