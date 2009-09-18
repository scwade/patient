class ReferenceFilterCitiesController < ApplicationController
  def index
    @reference_filter_cities = ReferenceFilterCity.find(:all, :conditions => ['description LIKE ?', "#{params[:search]}%"]) 
  end
end
