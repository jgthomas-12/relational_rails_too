class Areas::ClimbsController < ApplicationController
  # this controller is going to be associated with every climb inside a specific area
  def index
    @area = Area.find(params[:id])
    @climbs = @area.climbs
  end
end