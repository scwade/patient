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

ActiveRecord::Schema.define(:version => 20090901065316) do

  create_table "patient_profiles", :force => true do |t|
    t.integer  "pmd_patient_id",                  :null => false
    t.integer  "pmd_user_id",                     :null => false
    t.integer  "physician_id",                    :null => false
    t.string   "first_name",                      :null => false
    t.string   "last_name",                       :null => false
    t.string   "primary_address"
    t.string   "alternate_address"
    t.integer  "zip5_code",         :limit => 8
    t.integer  "zip4_ext"
    t.string   "city",              :limit => 60
    t.string   "state_province",    :limit => 2,  :null => false
    t.string   "email",                           :null => false
    t.string   "phone_home",        :limit => 10
    t.string   "phone_mobile",      :limit => 10
    t.string   "phone_work",        :limit => 10
    t.string   "phone_fax",         :limit => 10
    t.string   "phone_emergency",   :limit => 10
    t.date     "date_of_birth",                   :null => false
    t.string   "gender",            :limit => 1,  :null => false
    t.string   "ethnicity",         :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_addresses", :force => true do |t|
    t.integer  "zip5_code",               :null => false
    t.string   "state",      :limit => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_ethnicities", :force => true do |t|
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_filter_cities", :force => true do |t|
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_filter_states", :force => true do |t|
    t.string   "state",       :limit => 2,  :null => false
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
