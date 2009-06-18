class CreatePatientProfiles < ActiveRecord::Migration
  def self.up
    create_table  :patient_profiles, :primary_key => 'id', :options => "auto_increment = 1000"  do |t|
      t.string	  :first_name
      t.string	  :last_name
      t.date	  :date_of_birth
      t.string    :gender,		:limit  =>  1
      

    t.timestamps
    end
  end

  def self.down
    drop_table :patient_profiles
  end
end
