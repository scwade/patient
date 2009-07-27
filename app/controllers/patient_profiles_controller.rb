class PatientProfilesController < ApplicationController
  # GET /patient_profiles
  # GET /patient_profiles.xml
  def index
    @patient_profiles = PatientProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_profiles }
    end
  end

  # GET /patient_profiles/1
  # GET /patient_profiles/1.xml
  def show
    @patient_profile = PatientProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_profile }
    end
  end

  # GET /patient_profiles/new
  # GET /patient_profiles/new.xml
  def new
    @patient_profile = PatientProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_profile }
    end
  end

  # GET /patient_profiles/1/edit
  def edit
    @patient_profile = PatientProfile.find(params[:id])
  end

  # POST /patient_profiles
  # POST /patient_profiles.xml
  def create
    @patient_profile = PatientProfile.new(params[:patient_profile])

    respond_to do |format|
      if @patient_profile.save
        flash[:notice] = 'PatientProfile was successfully created.'
        format.html { redirect_to(@patient_profile) }
        format.xml  { render :xml => @patient_profile, :status => :created, :location => @patient_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_profiles/1
  # PUT /patient_profiles/1.xml
  def update
    @patient_profile = PatientProfile.find(params[:id])

    respond_to do |format|
      if @patient_profile.update_attributes(params[:patient_profile])
        flash[:notice] = 'PatientProfile was successfully updated.'
        format.html { redirect_to(@patient_profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_profiles/1
  # DELETE /patient_profiles/1.xml
  def destroy
    @patient_profile = PatientProfile.find(params[:id])
    @patient_profile.destroy

    respond_to do |format|
      format.html { redirect_to(patient_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
