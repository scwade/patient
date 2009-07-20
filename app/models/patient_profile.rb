class PatientProfile < ActiveRecord::Base

#For update/create
validates_date :date_of_birth, :before => Time.now.strftime("%d %b %y"), :after => '1 Jan 1900'


	def before_create
		self.pmd_patient_id = 11111111
		self.pmd_user_id = 22222222
	end	

end
