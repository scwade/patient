require 'test_helper'

class PatientProfileTest < ActiveSupport::TestCase

  #Test framework
  test "the truth" do
    assert true
  end

  #Presence_of tests  
  def test_should_not_be_valid_without_pmd_patient_id
    p = PatientProfile.create(:pmd_patient_id => nil,
      :pmd_user_id =>    2000,
      :physician_id =>   3000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:pmd_patient_id)
  end

  def test_should_not_be_valid_without_user_id
    p = PatientProfile.create(:pmd_user_id => nil,
      :pmd_patient_id => 1000,
      :physician_id =>   3000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:pmd_user_id)
  end

  def test_should_not_be_valid_without_physician_id
    p = PatientProfile.create(:physician_id => nil,
      :pmd_patient_id => 1000,
      :pmd_user_id =>    2000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:physician_id)
  end

  def test_should_not_be_valid_without_first_name
    p = PatientProfile.create(:first_name => nil,
      :pmd_patient_id => 1000,
      :pmd_user_id =>    2000,
      :physician_id =>   3000,
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:first_name)
  end

  def test_should_not_be_valid_without_last_name
    p = PatientProfile.create(:last_name => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:last_name)
  end

  def test_should_not_be_valid_without_state
    p = PatientProfile.create(:state => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:state)
  end

  def test_should_not_be_valid_without_country_province
    p = PatientProfile.create(:country_province => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:country_province)
  end

  def test_should_not_be_valid_without_country_province
    p = PatientProfile.create(:email_1 => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:email_1)
  end

  def test_should_not_be_valid_without_date_of_birth
    p = PatientProfile.create(:date_of_birth => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :gender => 'M',
      :ethnicity => 12)
    assert p.errors.on(:date_of_birth)
  end

  def test_should_not_be_valid_without_gender
    p = PatientProfile.create(:gender => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :ethnicity => 12)
    assert p.errors.on(:gender)
  end

  def test_should_not_be_valid_without_ethnicity
    p = PatientProfile.create(:ethnicity => nil,
      :pmd_patient_id => 100000000,
      :pmd_user_id =>    200000000,
      :physician_id =>   300000000,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M')
    assert p.errors.on(:ethnicity)
  end

  # Now see if we can add at least one
  def test_should_create_patient_profile
    p = PatientProfile.create(:pmd_patient_id => 1999,
      :pmd_user_id =>    2999,
      :physician_id =>   3999,
      :first_name => 'Rolland',
      :last_name => 'Hoyt',
      :state => 'CA',
      :country_province => 'AB',
      :email_1 => 'rolland1@proficientMD.com',
      :date_of_birth => Time.at(0),
      :gender => 'M',
      :ethnicity => 12)
    assert p.valid?
  end

end
