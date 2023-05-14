class Areas::ClimbsController < ApplicationController
  # this controller is going to be associated with every climb inside a specific area
  def index
    @areas = Area.all
    @climbs = Climb.all
    # require 'pry'; binding.pry
  end
end