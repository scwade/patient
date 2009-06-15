class TestData < ActiveRecord::Migration
  def self.up
    PatientProfile.delete_all

   PatientProfile.create ( :first_name => "Rolland", :last_name => "Hoyt" )
   PatientProfile.create ( :first_name => "Jacki", :last_name => "Hoyt" )
   PatientProfile.create ( :first_name => "Scott", :last_name => "Wade" )

  end

  def self.down
    PatientProfile.delete_all
  end
end
