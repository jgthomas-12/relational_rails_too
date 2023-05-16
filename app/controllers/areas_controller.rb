class AreasController < ApplicationController
  def index
    @areas = Area.sort_by_created_at
  end

  def show
    @area = Area.find(params[:id])
  end

end

