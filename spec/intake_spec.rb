require "timecop"
require "intake"

describe Intake do

  subject(:intake) do
    described_class.new(future_intake)
  end

  before do
    Timecop.travel(Date.parse("5th Aug 2015"))
  end

  after do
    Timecop.return
  end

  let(:future_intake) do
    {
      "start_date" => "12th October 2015",
      "end_date" => "15th January 2016"
    }
  end

  it "has a start date" do
    expect(intake.start_date).to eq(Date.parse(future_intake["start_date"]))
  end

  it "has a end date" do
    expect(intake.end_date).to eq(Date.parse(future_intake["end_date"]))
  end

  it "calculates the pre course start date" do
    precourse_start_date = Date.parse("14th September 2015")
    expect(intake.precourse_start_date).to eq(precourse_start_date)
  end

  context "when there is a custom pre course start date" do

    let(:future_intake) do
      {
        "start_date" => "12th October 2015",
        "end_date" => "15th January 2016",
        "precourse_start_date" => "20th April 2015"
      }
    end

    it "calculates the pre course start date" do
      precourse_start_date = Date.parse(future_intake["precourse_start_date"])
      expect(intake.precourse_start_date).to eq(precourse_start_date)
    end
  end


  describe "Finding intakes" do

    before do
      allow(YAML).to receive(:load_file).and_return(intakes)
    end

    let(:past_intake) do
      {
        "start_date" => "20 July 2015",
        "end_date" => "9 October 2015"
      }
    end

    let(:precourse_started_intake) do
      {
        "start_date" => "1st September 2015",
        "end_date" => "20th November 2015"
      }
    end

    let(:intakes) do
      [past_intake, precourse_started_intake, future_intake]
    end

    it "finds all advertised intakes where the precourse has not started yet" do
      intakes = [Intake.new(future_intake)]
      expect(described_class.advertised_dates).to eq(intakes)
    end
  end
end
