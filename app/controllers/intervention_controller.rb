class InterventionController < ApplicationController

  def find_buildings
    @buildingList = Building.where(customer_id: params[:customer_id])
    render json: {buildings: @buildingList}
  end

  def find_batteries
    @batteryList = Battery.where(building_id: params[:building_id])
    render json: {batteries: @batteryList}
  end

  def find_columns
    @columnList = Column.where(battery_id: params[:battery_id])
    render json: {columns: @columnList}
  end

  def find_elevators
    @elevatorList = Elevator.where(column_id: params[:column_id])
    render json: {elevators: @elevatorList}
  end
end