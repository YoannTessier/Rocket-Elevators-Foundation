class InterventionController < ApplicationController

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

  # CREATES A NEW INSTANCE OF INTERVENTION AND PUTS IT IN TABLE
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

      if interventions.save
        create_intervention_ticket()
        redirect_to '/interventions'
      end
  end

  # CREATES A NEW ZENDESK TICKET
  def create_intervention_ticket()
    client = ZendeskAPI::Client.new do |config|
        config.url = ENV['ZENDESK_URL']
        config.username = ENV['ZENDESK_USERNAME']
        config.token = ENV['ZENDESK_TOKEN']
    end
    ZendeskAPI::Ticket.create!(client, 
        :subject => "Intervention",
        :comment => { 
          :value => " 
          Intervention Request: \n
          - Requester: #{Employee.find_by(user_id: current_user.id).first_name} #{Employee.find_by(user_id: current_user.id).last_name}
          - Customer: #{Customer.find(params[:customer_id]).company_name}
          - Building ID: #{params[:building_id]} 
          - Battery ID: #{params[:battery_id]}
          - Column ID:  #{params[:column_id]} 
          - Elevator ID: #{params[:elevator_id]}
          - Assigned Employee: #{Employee.find(params[:employee_id]).first_name} #{Employee.find(params[:employee_id]).last_name}\n

          Description: #{params[:description]}"
          }, 
        :requester => client.current_user.id,
        :priority => "normal",
        :type => "problem"
      )
  end

  helper_method :getCustomers
  helper_method :getEmployees
end


   