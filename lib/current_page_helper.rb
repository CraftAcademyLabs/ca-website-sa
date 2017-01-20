module CurrentPageHelper
  def current_if_current_page(current_page, page)
    current_page.url == page ? 'current' : ''
  end
end
