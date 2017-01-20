require 'middleman-gh-pages'
require 'json'

namespace :assets do
  task :precompile do
    sh 'middleman build --verbose'
  end
end

desc "Publishes latest changes to bower"
namespace :publish do
  task :bower do
    publish_to_bower
  end
end

def publish_to_bower
  puts "Please enter a version number, previous version was #{bower["version"]}:"
  new_version = $stdin.gets
  puts "Compiling Sass files into CSS"
  `sass  --update source/sass:source/stylesheets`
  puts "Committing files to Git"
  `git add .`
  `git commit -m "Compiles and updates stylesheets in preperation for new version"`
  `bower version #{new_version}`
  `git add .`
  `git commit -m "Bumping Bower version"`
  `git push`
  puts "Pushing new tags to Github"
  `git push origin --tags`
  puts "Done!"
end

def bower
  JSON.load(File.new("bower.json"))
end

namespace :deploy do
  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  task :staging do
    deploy :staging
  end

  task :production do
    deploy :production
  end
end
