module ImageHelper
  CDN_URL = 'https://assets.craftacademy.se'

  def image_path(path)
    "#{CDN_URL}/images/#{path}"
  end

  def flag_image(flag)
    image_tag("icons/#{flag.to_s}_flag.png", style: 'height: 15px; position: relative; top: 3px;')
  end
end
