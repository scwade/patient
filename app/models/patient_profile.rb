class PatientProfile < ActiveRecord::Base

# ----------
# Callbacks
# ----------

#Scrub form
  before_save :clean_zip_code

#protected
  def clean_zip_code
    unless self.zip_code.blank?
      self.zip_code.gsub!(/-/, '')
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

  validates_format_of :zip_code,
                      :unless => Proc.new { |p| p.zip_code.blank? },
                      :message => "use 5 or 9 digit zip; 94587, 945871234, 94587-1234",
                      :with => /^\d{5}$|^\d{5}[-]\d{4}$|^\d{9}$/
                      
  
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
#  validates_length_of   :zip_code,           :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_home,         :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_work,         :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_mobile,       :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_fax,          :maximum => 10,     :allow_blank => true
#  validates_length_of   :phone_emergency,    :maximum => 10,     :allow_blank => true

# ---------------------
# Numeric validations
# ---------------------

  validates_numericality_of :pmd_patient_id, :pmd_user_id, :physician_id, :ethnicity
                            

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
