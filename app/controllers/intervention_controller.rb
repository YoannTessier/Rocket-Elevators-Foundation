class InterventionController < ApplicationController
  def intervention
  end

  def selectCustomers
    @customerSelection = Array.new
    Customer.all.each do |c|
      @customerSelection.append([c.company_name, c.id])
    end
    return @customerSelection
  end
  helper_method :selectCustomers
end
