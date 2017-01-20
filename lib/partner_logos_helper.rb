require './lib/image_helper'
require 'open-uri'
require 'json'

module PartnerLogosHelper
  API_URL = "https://api.github.com/repos/CrafrAcademy/craft-assets/contents/images/hiring-partners?access_token=#{ENV['GITHUB_ACCESS_TOKEN']}"

  def fetch_logos
    logos.map { |logo| "hiring-partners/#{logo['name']}" }
  end

  def alt_text_from_filename(logo_name)
    logo_name.split('/').last
             .split('.').first
             .gsub('-', ' ')
             .gsub(/\b(?<!['â`])[a-z]/, &:capitalize)
  end

  private

  def logos
    JSON.load(open(API_URL))
  end
end
