class TestData < ActiveRecord::Migration
  def self.up
    PatientProfile.delete_all

    PatientProfile.create ( :first_name => "Rolland", :last_name => "Hoyt", :date_of_birth => '19570902', :gender => "M" )
    PatientProfile.create ( :first_name => "Jacki",   :last_name => "Hoyt", :date_of_birth => '19601030', :gender => "F" )
    PatientProfile.create ( :first_name => "Scott",   :last_name => "Wade", :date_of_birth => '19630101', :gender => "M" )

  end

  def self.down
    PatientProfile.delete_all
  end
end
