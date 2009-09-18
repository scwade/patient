require 'test_helper'

class PatientProfilesTest < ActionController::IntegrationTest
  fixtures :patient_profiles

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  # Show status
  puts "Here we go"

  # Simulate a user round trip
  test "index new show edit update show index" do

    # Get a patient for later use
    @patient = patient_profiles(:chris)

    # Clear all patients
    PatientProfile.delete_all
    
    # Check for no patients
    assert_equal 0, PatientProfile.count

    # Go to index
    get "/patient_profiles"
    assert_response :ok
    assert_template "index"

    puts "Code :ok = "
  end

end
