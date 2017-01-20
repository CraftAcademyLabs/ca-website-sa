require 'markdown_helper'

class MarkdownHelperWrapper
  include MarkdownHelper
end

describe MarkdownHelperWrapper do

  let(:text) { "hello **world**" }
  let(:output) { "<p>hello <strong>world</strong></p>\n" }

  it "converts text into markdown" do
    expect(subject.markdown(text)).to eq(output)
  end
end
