require 'rails_helper'

RSpec.describe InterventionController do
  employee = InterventionController.new

  describe "getEmployees" do
    context "test for return" do
      it "should return an array" do
        expect(employee.getEmployees).to be_an_instance_of(Array)
      end
    end
  end

  describe "getEmployees" do
    context "test number of employees" do
      it "should return 7" do
        expect(employee.getEmployees.size).to eq(7)
      end
    end
  end
end
