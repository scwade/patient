class CreatePatientProfiles < ActiveRecord::Migration
  def self.up
    create_table  :patient_profiles, :primary_key => 'id', :options => "auto_increment = 1000"  do |t|
      t.integer   :pmd_patient_id,                :null => false,                :unique => true
      t.integer   :pmd_user_id,                   :null => false,                :unique => true
      t.integer   :physician_id,                  :null => false
      t.string    :first_name,                    :null => false 
      t.string    :last_name,                     :null => false
      t.string    :primary_address      
      t.string    :alternate_address 
      t.string    :zip_code,                                                     :limit => 9
      t.string    :city,                                                         :limit => 30
      t.string    :state_province,                :null => false,                :limit => 2 
      t.string    :email,                         :null => false                
      t.string    :phone_home,                                                   :limit => 10
      t.string    :phone_mobile,                                                 :limit => 10 
      t.string    :phone_work,                                                   :limit => 10
      t.string    :phone_fax,			                                 :limit => 10 
      t.string    :phone_emergency,                                              :limit => 10 
      t.date      :date_of_birth,                 :null => false
      t.string    :gender,                        :null => false,                :limit => 1
      t.integer   :ethnicity,                     :null => false,                :limit => 2 

    t.timestamps
    end
  end

  def self.down
    drop_table :patient_profiles
  end
end
