require 'current_page_helper'

class CurrentPageHelperWrapper
  include CurrentPageHelper
end

describe CurrentPageHelperWrapper do
  let(:current_page) { double(:current_page, url: "/") }

  it "outputs 'current' on the current page" do
    expect(subject.current_if_current_page(current_page, "/")).to eq "current"
  end

  it "outputs nothing if it is not the current page" do
    expect(subject.current_if_current_page(current_page, "/about/")).to eq ""
  end

end
