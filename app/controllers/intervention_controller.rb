class InterventionController < ApplicationController
  require 'zendesk_api'

  before_action :authenticate_user!
  # GETS COMPANY NAME AND ID + APPENDS IT IN @CUSTOMERS ARRAY
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
      @employees.append([e.first_name + ' ' + e.last_name, e.id])
    end
    return @employees
  end

  # APPENDS BUILDING INFO TO @BUILDINGLIST DEPENDING ON CUSTOMER SELECTION
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

  def new 
    @intervention = Intervention.new
  end

  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.author = current_user.id

    @buildingId = @intervention.building_id
    @batteryId = @intervention.battery_id
    @columnId = @intervention.column_id
    @elevatorId = @intervention.elevator_id
    @author = @intervention.author

    if (@intervention.elevator_id != nil && @intervention.elevator_id != " ")
      @intervention.building_id, @intervention.battery_id, @intervention.column_id = nil
    elsif (@intervention.column_id != nil && @intervention.column_id != " ")
      @intervention.building_id, @intervention.battery_id, @intervention.elevator_id = nil
    elsif (@intervention.battery_id != nil && @intervention.battery_id != " ")
      @intervention.building_id, @intervention.column_id, @intervention.elevator_id = nil
    elsif (@intervention.building_id != nil && @intervention.building_id != " ")
      @intervention.battery_id, @intervention.column_id, @intervention.elevator_id = nil
    end

    if @intervention.save!
      client = ZendeskAPI::Client.new do |client|
        client.url = 'https://rocketelevators5995.zendesk.com/api/v2'
        client.username = ENV['ZENDESK_USERNAME']
        client.token = ENV['ZENDESK_TOKEN']
      end

      ZendeskAPI::Ticket.create!(client, 
        :subject => "Intervention",
        :comment => { 
          :value => " 
          Intervention Request: \n
          - Requester: #{Employee.find_by(user_id: current_user.id).first_name} #{Employee.find_by(user_id: current_user.id).last_name}
          - Customer: #{Customer.find(@intervention.customer_id).company_name}
          - Building ID: #{@buildingId} 
          - Battery ID: #{@batteryId}
          - Column ID:  #{@columnId} 
          - Elevator ID: #{@elevatorId}
          - Assigned Employee: #{Employee.find(@intervention.employee_id).first_name} #{Employee.find(@intervention.employee_id).last_name}\n

          Description: #{@intervention.report}"
          }, 
        :requester => current_user.id,
        :priority => "normal",
        :type => "problem")
      end
        redirect_to '/interventions'
  end

  helper_method :getCustomers
  helper_method :getEmployees

  private

  def intervention_params
    params.permit(:author, :intervention_start, :intervention_end, :result, :status, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :report, :employee_id)
  end
end


   