require 'partner_logos_helper'

class PartnerLogosHelperWrapper
  include PartnerLogosHelper
end

describe PartnerLogosHelperWrapper do
  let(:logos) do
    [{
      "name" => "image.png"
    }].to_json
  end

  let(:logo_path) { "hiring-partners/image.png" }

  it "fetches a list of available partner logos" do
    allow(subject).to receive(:open).and_return(logos)
    expect(subject.fetch_logos).to eq([logo_path])
  end

  it "outputs human friendly titles for alt text and title" do
    full_path_logo = "hiring-partners/test-logo.png"
    expect(subject.alt_text_from_filename(full_path_logo)).to eq "Test Logo"
  end
end
