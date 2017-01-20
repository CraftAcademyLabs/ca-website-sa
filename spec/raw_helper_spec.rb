require 'raw_helper'

class RawHelperWrapper
  include RawHelper
end

describe RawHelperWrapper do
  subject { described_class.new }
  let(:partial) { File.join(".", "spec", "fixtures", "_test_haml.html.haml") }
  let(:haml) do
    "%section
  %container
    %copy
      %h1.header I'm a header!"
  end

  it "renders the partial's raw contents" do
    file = File.open(partial)
    allow(subject).to receive(:load_partial).and_return file
    expect(subject.raw(partial)).to eq haml
  end
end
