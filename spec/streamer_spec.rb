require 'elevator_media'

describe ElevatorMedia::Streamer do

    describe "getContent" do
        context "test for type" do
            it "returns a string" do
                expect(ElevatorMedia::Streamer.getContent("spotify")).to be_kind_of(String)
            end
        end
    end
    
    describe "getContent" do
        context "test for return" do
            it "doesn't return an empty string" do
                expect(ElevatorMedia::Streamer.getContent("spotify")).not_to eq("")
            end
        end
    end

    describe "getContent" do
        context "test for html" do
            it "returns a <div> tag" do
                expect(ElevatorMedia::Streamer.getContent("spotify")).to include("<div>", "</div>")
            end
        end
    end

    describe "getContent" do
        context "test for type" do
            it "returns a string" do
                expect(ElevatorMedia::Streamer.getContent("flights")).to be_kind_of(String)
            end
        end
    end

    describe "getContent" do
        context "test for return" do
            it "doesn't return an empty string" do
                expect(ElevatorMedia::Streamer.getContent("flights")).not_to eq("")
            end
        end
    end

    describe "getContent" do
        context "test for html" do
            it "returns <div> tags" do
                expect(ElevatorMedia::Streamer.getContent("flights")).to include("<div>", "</div>")
            end
        end
    end
end
