class CreatePatientProfiles < ActiveRecord::Migration
  def self.up
    create_table :patient_profiles do |t|
      t.integer  :patient_id,   :null => false
      t.string   :first_name,   :null => false
      t.string   :last_name,    :null => false
      t.string   :address,      :null => true
      t.string   :city,         :null => true
      t.string   :state,        :null => true
      t.integer  :zip_code,     :null => true
      t.string   :province,     :null => true
      t.string   :country,      :null => true

      t.timestamp  :created_on,  :null => false
      t.timestamp  :updated_on,  :null => false
    end
  end

  def self.down
    drop_table :patient_profiles
  end
end
