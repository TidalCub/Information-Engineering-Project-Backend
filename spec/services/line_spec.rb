require "rails_helper"

RSpec.describe Line do
  describe "#status" do
    context "when there is a distruption" do
      it "returns the status of the line" do
        VCR.use_cassette("line_status") do
          expect(Line.new.status("central")).to match_array(
            severity_descriptor: "Minor Delays",
            severity_level: 9,
          )
        end
      end
    end
  end
end