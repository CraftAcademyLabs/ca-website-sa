# Converts strings to URL-friendly slugs
module SlugHelper
  def slug(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def graduate_slug(graduate)
    slug(graduate[:first_name] + ' ' + graduate[:last_name])
  end
end
