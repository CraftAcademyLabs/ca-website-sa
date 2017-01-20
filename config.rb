activate :dotenv
# This is the website version registered in Mixpanel
# It should match the minor version (e.g. 2.1) of the website
set :website_version, 2.3

Dir['lib/*.rb'].each { |file| require file }

###
# Compass
###

activate :directory_indexes
activate :meta_tags

set :url_root, 'https://craftacademy.se'
activate :search_engine_sitemap

# disable layout
page '.htaccess.apache', layout: false

# rename file after build
after_build do
  File.rename 'build/.htaccess.apache', 'build/.htaccess'
end

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers CurrentPageHelper,
        PartnerLogosHelper,
        MarkdownHelper,
        PossessiveHelper,
        SlugHelper,
        ImageHelper,
        GraduatesHelper,
        RawHelper,
        StatsHelper

helpers do
  def page_is_sa_homepage?
    current_page.url == '/english/za/'
  end

  def current_page_is_sa?
    current_page.url.match(/ pretoria|south-africa|za/)
  end

  def current_page_is_campaign_page?
    current_page.url.match(/di-digital|stockholmer/)
  end

  def international_pages?
    current_page.url.match(/international|pretoria|south-africa|za/)
  end
end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
data.graduates.each do |grad|
  if grad[:case_study]
    url_slug = graduate_slug(grad)
    proxy "/case-studies/#{url_slug}.html", '/case-studies/template.html', locals: { grad: grad }, ignore: true
  end
end

data.graduates_en.each do |grad|
  if grad[:case_study]
    url_slug = graduate_slug(grad)
    proxy "/english/students/#{url_slug}.html", '/english/case-studies/template.html', locals: { grad: grad }, ignore: true
  end
end

page '/english/*', layout: 'en_layout'

set :css_dir, 'sass'
set :js_dir, 'javascripts'
set :partials_dir, 'partials'
set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

set :apply_form_url, 'https://craftacademy.typeform.com/to/V4mFcd'
set :apply_form_url_english, 'https://craftacademy.typeform.com/to/hkkxKQ'
set :apply_sa_form_url, 'http://apply.thecraftacademy.co.za'
set :hire_form_url, 'https://craftacademy.typeform.com/to/SQcaqh'
set :class_site_url, 'http://class.craftacademy.se'

# Ignore folders with unused templates
ignore 'elements/*'
ignore 'not_in_use/*'
# ignore 'case-studies/*' #as long as we don't present students

# Redirects from old site urls
redirect 'payments/new.html', to: config.apply_form_url
redirect 'apply.html', to: config.apply_form_url
redirect 'apply-for-ronin.html', to: config.apply_form_url
redirect 'blog.html', to: 'https://blog.craftacademy.se'
redirect 'pretoria.html', to: 'south-africa.html'
redirect 'south-africa.html', to: 'english/za/index.html'

activate :deploy do |deploy|
  deploy.method          = :rsync
  deploy.host            = ENV.fetch('HOST')
  deploy.path            = ENV.fetch('DEPLOY_PATH')
  deploy.user            = ENV.fetch('DEPLOY_USER')
  deploy.build_before    = true
  deploy.clean           = true
end

configure :development do
  activate :livereload

  # custom setting for switching off analytics in development
  set :run_analytics, false

  # turn on to view a baseline grid for setting vertical rhythm
  set :show_baseline_grid, false
end

# Build-specific configuration
configure :build do
  # activate :imageoptim do |options|
  #   options.pngout    = false
  #   options.svgo      = false
  # end

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  set :run_analytics, true

  set :show_baseline_grid, false

  # Filewatcher ignore list
  set :file_watcher_ignore, [
    /^bin(\/|$)/,
    /^\.bundle(\/|$)/,
    # /^vendor(\/|$)/,
    /^node_modules(\/|$)/,
    /^\.sass-cache(\/|$)/,
    /^\.cache(\/|$)/,
    /^\.git(\/|$)/,
    /^\.gitignore$/,
    /\.DS_Store/,
    /^\.rbenv-.*$/,
    /^Gemfile$/,
    /^Gemfile\.lock$/,
    /~$/,
    /(^|\/)\.?#/,
    /^tmp\//
  ]
end
