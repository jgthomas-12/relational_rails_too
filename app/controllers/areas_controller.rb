class AreasController < ApplicationController
  def index
    @areas = Area.all.order(:created_at)
  end

  def show
    @area = Area.find(params[:id])
  end

end

