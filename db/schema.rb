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

ActiveRecord::Schema.define(:version => 20090615032709) do

  create_table "patient_profiles", :force => true do |t|
    t.integer  "pmd_patient_id",                  :null => false
    t.integer  "pmd_user_id",                     :null => false
    t.integer  "physician_id"
    t.string   "first_name",                      :null => false
    t.string   "last_name",                       :null => false
    t.string   "primary_address"
    t.string   "alternate_address"
    t.string   "city",              :limit => 30
    t.string   "state",             :limit => 2
    t.string   "zip_code",          :limit => 9
    t.string   "country_province",  :limit => 2
    t.string   "email_1"
    t.string   "email_2"
    t.string   "phone_home",        :limit => 10
    t.string   "phone_mobile",      :limit => 10
    t.string   "phone_work",        :limit => 10
    t.string   "phone_fax",         :limit => 10
    t.string   "phone_emergency",   :limit => 10
    t.date     "date_of_birth"
    t.string   "gender",            :limit => 1
    t.integer  "ethnicity",         :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
