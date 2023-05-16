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

  private

  def area_params
    params.permit(:name)
    # do this for all the attributes (want user to edit)
  end

end

