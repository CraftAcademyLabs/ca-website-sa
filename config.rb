activate :dotenv
# This is the website version registered in Mixpanel
# It should match the minor version (e.g. 2.1) of the website
set :website_version, 2.3

Dir['lib/*.rb'].each { |file| require file }

activate :directory_indexes
activate :meta_tags

set :url_root, 'https://thecraftacademy.co.za'
activate :search_engine_sitemap

# disable layout
page '.htaccess.apache', layout: false

# rename file after build
after_build do
  File.rename 'build/.htaccess.apache', 'build/.htaccess'
end

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
data.graduates_en.each do |grad|
  next unless grad[:case_study]
  url_slug = graduate_slug(grad)
  proxy "/students/#{url_slug}.html",
        '/case-studies/template.html', locals: { grad: grad }, ignore: true
end

set :css_dir, 'sass'
set :js_dir, 'javascripts'
set :partials_dir, 'partials'
set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

set :apply_form_url, 'https://craftacademy.typeform.com/to/V4mFcd'
set :apply_form_url_english, 'https://craftacademy.typeform.com/to/hkkxKQ'
set :apply_sa_form_url, 'http://apply.craftacademy.africa'
set :hire_form_url, 'https://craftacademy.typeform.com/to/SQcaqh'
set :class_site_url, 'http://class.craftacademy.se'

# Ignore folders with unused templates
ignore 'elements/*'

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
    %r{^bin(\/|$)},
    %r{^\.bundle(\/|$)},
    # /^vendor(\/|$)/,
    %r{^node_modules(\/|$)},
    %r{^\.sass-cache(\/|$)},
    %r{^\.cache(\/|$)},
    %r{^\.git(\/|$)},
    /^\.gitignore$/,
    /\.DS_Store/,
    /^\.rbenv-.*$/,
    /^Gemfile$/,
    /^Gemfile\.lock$/,
    /~$/,
    %r{(^|\/)\.?#},
    %r{^tmp\/}
  ]
end
