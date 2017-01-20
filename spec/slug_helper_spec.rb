require 'slug_helper'

class SlugHelperWrapper
  include SlugHelper
end

describe SlugHelperWrapper do

  let(:string) { "Alice 'Jimmy' Jameson" }
  let(:slug) { "alice-jimmy-jameson" }

  let(:graduate) do
    { first_name: "Alice 'Jimmy'", last_name: "Jameson" }
  end
  let(:graduate_slug) { "alice-jimmy-jameson" }

  it "converts strings to slugs" do
    expect(subject.slug(string)).to eq(slug)
  end

  it "converts graduates to slugs" do
    expect(subject.graduate_slug(graduate)).to eq(graduate_slug)
  end
end
