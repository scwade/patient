class PatientProfile < ActiveRecord::Base

# ----------
# Callbacks
# ----------

#Scrub form
  before_save :clean_zip_code

#protected
  def clean_zip_code
    unless self.zip_code.blank?
      self.zip_code.sub!(/\D/, '')
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

  validates_confirmation_of :email_1,
                            :unless => Proc.new { |p| p.email_1.blank? },
                            :message => "verification failed, please re-type email address's"
                            

# ---------------------
# Exclusion validations
# ---------------------

  validates_exclusion_of :first_name, :last_name, 
                         :in => %w{ fuck, shit },
                         :message => "No four letter words"
                          

# ------------------
# Format validations
# ------------------

  validates_format_of :zip_code,
                      :unless => Proc.new { |p| p.zip_code.blank? },
                      :message => "use 5 or 9 digit zip; 94587, 945871234, 94587-1234",
                      :with => %r{^\d{5}(-\d{4})?}
                      
  
  validates_format_of :email_1,
                      :message => "use format like name@proficientmd.com",
                      :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
                      
  
  validates_format_of :phone_home,
                      :unless => Proc.new { |p| p.phone_home.blank? },
                      :message => "( use all 10 digits like 8005551212)",
                      :with => /\d{10}/
                       

  validates_format_of :phone_mobile,
                      :unless => Proc.new { |p| p.phone_mobile.blank? },
                      :message => "( use all 10 digits like 8005551212)",
                      :with => /\d{10}/
                      

  validates_format_of :phone_work,
                      :unless => Proc.new { |p| p.phone_work.blank? },
                      :message => "( use all 10 digits like 8005551212)",
                      :with => /\d{10}/
                      

  validates_format_of :phone_fax,
                      :unless => Proc.new { |p| p.phone_fax.blank? },
                      :message => "( use all 10 digits like 8005551212)",
                      :with => /\d{10}/
                      

  validates_format_of :phone_emergency,
                      :unless => Proc.new { |p| p.phone_emergency.blank? },
                      :message => "( use all 10 digits like 8005551212)",
                      :with => /\d{10}/
                      

# ---------------------
# Inclusion validations
# ---------------------

  validates_inclusion_of :gender,
                       :in => %w{ M F },
                       :message => "system error, contact administrator"
                        

# ------------------
# Length validations
# ------------------

  validates_length_of   :first_name,         :maximum => 255                              
  validates_length_of   :last_name,          :maximum => 255                              
  validates_length_of   :primary_address,    :maximum => 255,    :allow_blank => true     
  validates_length_of   :alternate_address,  :maximum => 255,    :allow_blank => true     
  validates_length_of   :city,               :maximum => 30,     :allow_blank => true     
  validates_length_of   :state,              :is => 2                                     
  validates_length_of   :zip_code,           :in => 5..10,       :allow_blank => true     
  validates_length_of   :phone_home,         :is => 10,          :allow_blank => true     
  validates_length_of   :phone_work,         :is => 10,          :allow_blank => true     
  validates_length_of   :phone_mobile,       :is => 10,          :allow_blank => true     
  validates_length_of   :phone_fax,          :is => 10,          :allow_blank => true     
  validates_length_of   :phone_emergency,    :is => 10,          :allow_blank => true     
  validates_length_of   :country_province,   :is => 2                                     

# ---------------------
# Numeric validations
# ---------------------

  validates_numericality_of :pmd_patient_id, :pmd_user_id, :physician_id, :ethnicity
                            

# --------------------
# Presence validations
# --------------------

  validates_presence_of :physician_id, :first_name, :last_name, :state, :country_province, :gender, :ethnicity
                        


# ----------------------
# Uniqueness validations
# ----------------------

  validates_uniqueness_of :pmd_patient_id, :pmd_user_id, :email_1,
                          :case_sensitive => :false,
                          :message => "not unique, already used by different patient"
                          

#-------------------
# End of model class
#-------------------
end
