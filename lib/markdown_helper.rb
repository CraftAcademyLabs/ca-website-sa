require 'tilt'

module MarkdownHelper

  def markdown(source)
    Tilt['markdown'].new { source }.render
  end
end
