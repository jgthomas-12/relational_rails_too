class AreasController < ApplicationController
  def index
    @areas = Area.sort_by_created_at
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
  end

  def create
    Area.create!(area_params) #add the rest of the attributes
    redirect_to "/areas"
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    area = Area.find(params[:id])
    area.update(area_params)
    redirect_to "/areas/#{area.id}"
  end

  private

  def area_params
    params.permit(:name, :town, :camping, :parking_spaces)
    # do this for all the attributes (want user to edit)
  end

end

