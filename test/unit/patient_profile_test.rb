require 'test_helper'

DEBUG_IS_ON = 0

class PatientProfileTest < ActiveSupport::TestCase
  
  # load fixtures in case rake -I is used
  fixtures :patient_profiles

  # Test framework
  test "the truth" do
    assert true
  end

  # -----------------------------------------------------------------------------------------
  # Test inclusion_of :gender
  # -----------------------------------------------------------------------------------------
  def test_for_inclusion_of

    # Create object
      p = PatientProfile.new

    # Test for good
      p.gender = 'M'
      p.valid? # force error, if any
      assert !p.errors.invalid?(:gender)
      p.gender = 'F'
      p.valid?
      assert !p.errors.invalid?(:gender)

    # Test for bad
      p.gender = 'T'
      p.valid?
      assert p.errors.invalid?(:gender)
      assert_equal I18n.translate('activerecord.errors.messages.inclusion'), p.errors.on(:gender)
      
  end

  # -----------------------------------------------------------------------------------------
  # Test format_of :zip_code
  # -----------------------------------------------------------------------------------------
  def test_for_format_of_zip_code

    # test data
      good = %W( 94587 94587-1234 )
       bad = %W( 9458 9458712345 94587--123 94587@1234 abcde abcdefghij abcde-fghi a-1234 94587-abcd ) 

    # Create object
      p = PatientProfile.new

    # Test for good zip codes
      good.each do |x|
        p.zip_code = x
        p.valid? # force error, if any
        assert !p.errors.invalid?(:zip_code)
      end

    # Test for bad zip codes
      bad.each do |x|
        p.errors.clear
        p.zip_code = x
        p.valid? # force the error
        puts "X = #{}" + p.errors.on(:zip_code) unless DEBUG_IS_ON == 0
        assert p.errors.invalid?(:zip_code)
        assert_equal "use 5 or 9 digit zip; 94587, 945871234, 94587-1234", p.errors.on(:zip_code)
      end

  end 

  # -----------------------------------------------------------------------------------------
  # Test format_of :email 
  # -----------------------------------------------------------------------------------------
  def test_for_format_of_email

    # test data
      good = %W( h@h.com h@h.net h@h.gov abcdefghijk0123456789@abcdefghijk0123456789.com )
       bad = %W( @h.com hh.com h@.com h@hcom h@h. )

    # Create object
      p = PatientProfile.new

    # Test for good email format
      good.each do |x|
        p.errors.clear
        p.email = x
        p.valid? # force error if any
        assert !p.errors.invalid?(:email)
      end

    # Test for bad email format
      bad.each do |x|
        p.errors.clear
        p.email = x
        p.valid? # force the error
        assert p.errors.invalid?(:email)
      end

  end

  # -----------------------------------------------------------------------------------------
  # Test format_of :phone_xxx
  # -----------------------------------------------------------------------------------------
  def test_for_format_of_phone_numbers
    # test conditions
      bad = %W( 012345678 abcdefghij )

    # Create object
      p = PatientProfile.new

    # Test for good phone format
      p.phone_home = p.phone_work = p.phone_mobile = p.phone_fax = p.phone_emergency = "0123456789" 
      p.valid? # force error if any
      assert !p.errors.invalid?(:phone_home)
      assert !p.errors.invalid?(:phone_mobile)
      assert !p.errors.invalid?(:phone_work)
      assert !p.errors.invalid?(:phone_fax)
      assert !p.errors.invalid?(:phone_emergency)

    # Test for bad phone format
      bad.each do |x|
        p.errors.clear
        p.phone_home = p.phone_mobile = p.phone_work = p.phone_fax = p.phone_emergency = x.to_s
        p.valid? # force the error
        assert_equal I18n.translate('activerecord.errors.messages.invalid'), p.errors.on(:phone_home)
        assert_equal I18n.translate('activerecord.errors.messages.invalid'), p.errors.on(:phone_mobile)
        assert_equal I18n.translate('activerecord.errors.messages.invalid'), p.errors.on(:phone_work)
        assert_equal I18n.translate('activerecord.errors.messages.invalid'), p.errors.on(:phone_fax)
        assert_equal I18n.translate('activerecord.errors.messages.invalid'), p.errors.on(:phone_emergency)
      end
  end

  # -----------------------------------------------------------------------------------------
  # Test presence_of validation  
  # -----------------------------------------------------------------------------------------
  def test_for_prsence_of_attributes

    # Create object
    p = PatientProfile.new

    #Force validation check with
    assert !p.valid?

    # Check @errors{} at least one error reported
    assert p.errors.invalid?(:physician_id)
    assert p.errors.invalid?(:first_name)
    assert p.errors.invalid?(:last_name)
    assert p.errors.invalid?(:state_province)
    assert p.errors.invalid?(:date_of_birth)
    assert p.errors.invalid?(:gender)
    assert p.errors.invalid?(:ethnicity)

  end


  # ---------------------------------------------------------------------------------------
  # Now see if we can add at least one
  # -------------------------------------------------------------------------------------
  def test_for_create_patient_profile_is_valid

    # Create object
    p = PatientProfile.create(:pmd_patient_id => 1999,
                              :pmd_user_id =>    2999,
                              :physician_id =>   3999,
                              :first_name => 'Rolland',
                              :last_name => 'Hoyt',
                              :state_province => 'AB',
                              :email => 'rolland1@proficientMD.com',
                              :date_of_birth => Time.at(0),
                              :gender => 'M',
                              :ethnicity => 12)

    # Check object is valid
    assert p.valid?
  end

  # ---------------------------------------------------------------------------------------
  # Test uniqness_of validation
  # ---------------------------------------------------------------------------------------
  def test_for_uniqness_of_attributes

    # Use test fixture data
    p = PatientProfile.create(:pmd_patient_id => patient_profiles(:rolland).pmd_patient_id,
                              :pmd_user_id    => patient_profiles(:rolland).pmd_user_id, 
                              :email          => patient_profiles(:rolland).email)

   # Check @errors{}
   assert p.errors.invalid?(:pmd_patient_id)
   assert p.errors.invalid?(:pmd_user_id)
   assert p.errors.invalid?(:email)

   # Check @errors{} msg
   puts "Hello" unless DEBUG_IS_ON == 0 
   puts "Error reported = " + p.errors[:pmd_patient_id] unless DEBUG_IS_ON == 0 
   puts "Error returned = " + p.errors.on(:pmd_patient_id) unless DEBUG_IS_ON == 0 

   assert_equal "not unique, already used by different patient", p.errors.on(:pmd_patient_id)
   assert_equal "not unique, already used by different patient", p.errors.on(:pmd_user_id)
   assert_equal "not unique, already used by different patient", p.errors.on(:email) 
  end

  # ---------------------------------------------------------------------------------------------
  # Test numericality_of
  # ---------------------------------------------------------------------------------------------
  def test_for_numericality_of_attributes

    # Create object
    p = PatientProfile.create(:pmd_patient_id => "a",
                              :pmd_user_id    => "b",
                              :physician_id   => "c",
                              :ethnicity      => "d")

    # Check @errors{}
    assert p.errors.invalid?(:pmd_patient_id)
    assert p.errors.invalid?(:pmd_user_id)
    assert p.errors.invalid?(:physician_id)
    assert p.errors.invalid?(:ethnicity)

    # Check @errors{} msg
    assert_equal I18n.translate('activerecord.errors.messages.not_a_number'), p.errors.on(:pmd_patient_id)
    assert_equal I18n.translate('activerecord.errors.messages.not_a_number'), p.errors.on(:pmd_user_id)
    assert_equal I18n.translate('activerecord.errors.messages.not_a_number'), p.errors.on(:physician_id)
    assert_equal I18n.translate('activerecord.errors.messages.not_a_number'), p.errors.on(:ethnicity)
  end


  # ---------------------------------------------------------------------------------------------
  # Test length_of
  # ---------------------------------------------------------------------------------------------
  def test_for_length_of_attributes
    # Need test data
    @max_255 = @max_30 = @max_9 = @is_2 = ""
    255.times { @max_255 = @max_255 + "a" }
     30.times { @max_30  = @max_30  + "a" }
      2.times { @is_2    = @is_2    + "a" }

    # Now array to string
    @max_255 = @max_255.to_s
    @max_30  = @max_30.to_s
    @is_2    = @is_2.to_s

    # Lets test limits
    p = PatientProfile.new(:first_name          => @max_255 + "z",
                           :last_name           => @max_255 + "y",
                           :primary_address     => @max_255 + "x",
                           :alternate_address   => @max_255 + "w",
                           :city                => @max_30  + "v",
                           :state_province      => @is_2    + "u",
                           :email               => @max_255 + "t")

    assert !p.valid?

    # Check @errors{}
    assert p.errors.invalid?(:first_name)
    assert p.errors.invalid?(:last_name)
    assert p.errors.invalid?(:primary_address)
    assert p.errors.invalid?(:alternate_address)
    assert p.errors.invalid?(:city)
    assert p.errors.invalid?(:state_province)
 

    # Check @errors{} msg
    assert_equal I18n.translate('activerecord.errors.messages.too_long',     :count=>255), p.errors.on(:first_name)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',     :count=>255), p.errors.on(:last_name)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',     :count=>255), p.errors.on(:primary_address)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',     :count=>255), p.errors.on(:alternate_address)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',     :count=>30),  p.errors.on(:city)
    assert_equal I18n.translate('activerecord.errors.messages.wrong_length', :count=>2),   p.errors.on(:state_province)
  


    # Lets test limits ok at max
    p = PatientProfile.new(:first_name          => @max_255,
                           :last_name           => @max_255,
                           :primary_address     => @max_255,
                           :alternate_address   => @max_255,
                           :city                => @max_30,
                           :state_province      => @is_2)

    assert !p.valid?

    # Check @errors{} not reported
    assert !p.errors.invalid?(:first_name)
    assert !p.errors.invalid?(:last_name)
    assert !p.errors.invalid?(:primary_address)
    assert !p.errors.invalid?(:alternate_address)
    assert !p.errors.invalid?(:city)
    assert !p.errors.invalid?(:state_province)

  end

# ---------------------------
# End of PatientProfileTest 
# ---------------------------

end 
