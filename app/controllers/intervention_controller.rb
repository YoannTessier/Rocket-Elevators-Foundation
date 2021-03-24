class InterventionController < ApplicationController

  def getCustomers
    @customers = []
    Customer.all.each do |c|
      @customers.append([c.company_name, c.id])
    end
    return @customers
  end

  def getEmployees
    @employees = []
    Employee.all.each do |e|
      @employees.append([e.last_name, e.id])
    end
    return @employees
  end

  def find_buildings
    @buildingList = []
    Building.where(customer_id: params[:customer_id]).each do |b|
      @buildingList.append([b.id, b.address_building])
    end
    render json: {buildings: @buildingList}
  end

  def find_batteries
    @batteryList = []
    Battery.where(building_id: params[:building_id]).each do |b|
      @batteryList.append(b.id)
    end
    render json: {batteries: @batteryList}
  end

  def find_columns
    @columnList = []
    Column.where(battery_id: params[:battery_id]).each do |c|
      @columnList.append(c.id)
    end
    render json: {columns: @columnList}
  end

  def find_elevators
    @elevatorList = []
    Elevator.where(column_id: params[:column_id]).each do |e|
      @elevatorList.append(e.id)
    end
    render json: {elevators: @elevatorList}
  end

  def create_intervention
        
    interventions = Intervention.new
    interventions.author = current_user.id
    interventions.customer_id = params[:customer_id]
    interventions.building_id = params[:building_id]
    interventions.battery_id = params[:battery_id]
    interventions.column_id = params[:column_id]
    interventions.elevator_id = params[:elevator_id]
    interventions.employee_id = params[:employee_id]
    interventions.report = params[:description]

    interventions.save!

    redirect_to '/interventions'
  end

  helper_method :getCustomers
  helper_method :getEmployees
end