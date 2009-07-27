class PatientProfileController < ApplicationController
  def index
    @patient_profile = PatientProfile.find(:all) 
  end

  def new
  end

  def show
  end

  def update
  end

  def delete
  end

end
