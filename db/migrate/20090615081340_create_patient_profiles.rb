class CreatePatientProfiles < ActiveRecord::Migration
  def self.up
    create_table :patient_profiles, :primary_key => 'patient_id', :options => "auto_increment = 1000"  do |t|
      t.integer	:patient_id
      t.string	:first_name
      t.string	:last_name
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zip_code
      t.string  :province
      t.string  :country
      
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_profiles
  end
end
