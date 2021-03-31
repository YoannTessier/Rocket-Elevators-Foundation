require "rails_helper"

RSpec.describe "routes for find_buildings ", :type => :routing do
    context "test route for find_buildings" do
        it "routes find_buildings to the intervention controller" do
            expect(get("find_buildings")).to route_to("intervention#find_buildings")
        end
    end
end

