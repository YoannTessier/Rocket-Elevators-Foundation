class BuildingsController < ApplicationController
    def findBuildings
       @customer = Customer.new
       @customers = Customer.all
       @customerId = params[:customer_id].to_s
       @buildings = []

        if @customerId != " "
            Building.where(customer_id: @customerId).each do |b|
                @buildings.append(b.id)
            end
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {buildings: @buildings}
                }
            end
        end
    end
end

