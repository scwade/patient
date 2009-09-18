class PatientProfile < ActiveRecord::Base

# ----------
# Callbacks
# ----------

#Scrub form
  before_save :validate_state, :clean_first_last_name

#protected
  def validate_state
    unless self.zip5_code.blank?
      puts "Checking zip code!"
    end
  end

  def clean_first_last_name
    unless self.first_name.blank?
      self.first_name.squish!
      self.last_name.squish!
    end
  end

# ---------------------------
# From plugin - Date validation
# ----------------------------
  validates_date :date_of_birth, 
                 :before => Time.now.strftime("%d %b %y"), 
                 :after => '1 Jan 1900'

#-------------------------
# Confirmation validations
#-------------------------

  validates_confirmation_of :email,
                            :unless => Proc.new { |p| p.email.blank? },
                            :message => "verification failed, please re-type email address's"

# ------------------
# Format validations
# ------------------

  validates_format_of :zip5_code,
                      :unless => Proc.new { |p| p.zip5_code.blank? },
                      :with => /^\d{4,5}$/

  validates_format_of :zip4_ext,
                      :unless => Proc.new { |p| p.zip4_ext.blank? },
                      :with => /^\d{4}$/
  
  validates_format_of :email,
                      :message => "use format like name@proficientmd.com",
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
                      
  
  validates_format_of :phone_home,
                      :unless => Proc.new { |p| p.phone_home.blank? },
                      :with => /\d{10}$/
                       

  validates_format_of :phone_mobile,
                      :unless => Proc.new { |p| p.phone_mobile.blank? },
                      :with => /\d{10}$/
                      

  validates_format_of :phone_work,
                      :unless => Proc.new { |p| p.phone_work.blank? },
                      :with => /\d{10}$/
                      

  validates_format_of :phone_fax,
                      :unless => Proc.new { |p| p.phone_fax.blank? },
                      :with => /\d{10}$/
                      

  validates_format_of :phone_emergency,
                      :unless => Proc.new { |p| p.phone_emergency.blank? },
                      :with => /\d{10}$/
                      

# ---------------------
# Inclusion validations
# ---------------------

  validates_inclusion_of :gender,
                       :in => %w{ M F }
                        

# ------------------
# Length validations
# ------------------

  validates_length_of   :first_name,         :maximum => 255                              
  validates_length_of   :last_name,          :maximum => 255                              
  validates_length_of   :primary_address,    :maximum => 255,    :allow_blank => true     
  validates_length_of   :alternate_address,  :maximum => 255,    :allow_blank => true     
  validates_length_of   :city,               :maximum => 30,     :allow_blank => true                                        
  validates_length_of   :state_province,     :is => 2                                     
  validates_length_of   :ethnicity,          :maximum => 60
#  validates_length_of   :zip5,               :is => 5,           :allow_blank => true
#  validates_length_of   :zip4_ext,           :is => 4,           :allow_blank => true
#  validates_length_of   :phone_home,         :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_work,         :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_mobile,       :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_fax,          :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_emergency,    :maximum => 10,     :allow_blank => true

# ---------------------
# Numeric validations
# ---------------------

  validates_numericality_of :pmd_patient_id, :pmd_user_id, :physician_id
                            

# --------------------
# Presence validations
# --------------------

  validates_presence_of :physician_id, :first_name, :last_name, :date_of_birth, :state_province, :gender, :ethnicity
                        


# ----------------------
# Uniqueness validations
# ----------------------

  validates_uniqueness_of :pmd_patient_id, :pmd_user_id, :email,
                          :case_sensitive => :false,
                          :message => "not unique, already used by different patient"
                          

#-------------------
# End of model class
#-------------------
end
