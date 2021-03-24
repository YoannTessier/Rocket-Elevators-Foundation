class InterventionController < ApplicationController

  def update_buildings
    @buildingList = Building.where(customer_id: params[:customer_id])
    render json: {buildings: @buildingList}
  end
end