add_source 'http://rubygems.snc1'
#remove rubygems.org source from gemfile.
run "sed -i '' '/rubygems.org/d' Gemfile"

gem_group :development, :test do
  gem 'spring-commands-rspec'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rspec'
  gem 'rspec-rails'
end

gem_group :test do
  gem 'webmock'
  gem 'factory_girl_rails', '~> 4.0'

  gem 'resque_spec'
end

gem 'rails_config'
gem 'whenever'
gem 'after_party'

after_bundle do
  git add: "."
  git commit: %Q{ -m 'created new project from rails_template' }
end

  git_url = ask("What is the URL for the Github repo?")
  run "git init"
  run "git remote add origin #{git_url}" 
  #if repo is already initialized...
  run "git fetch"
  run "rm .gitignore"
  run "git pull origin master"
  run "git branch --set-upstream-to=origin/master master"
  

#replace rdoc with markdown (getting example from gist)
run "rm README.rdoc"
run "curl -sL https://gist.githubusercontent.com/jxson/1784669/raw/91543915eadb2423561f9ec7cdcbe039debf10de/README.md -o README.md"

#get outta here minitest.
run "rm -rf ./test"
run "rails generate rspec:install"

#install rails_config
run "rails generate rails_config:install"

#add .ruby-version and .ruby-gemset
run "echo '#{app_name}' > .ruby-gemset" 
run "echo '2.2.1' > .ruby-version"

#get the awesome bin/setup script
run "curl -sL https://raw.github.com/thestevemitchell/bin_setup/master/bin/setup -o bin/setup"

#create Brewfile with postgres by default
run "echo \"brew 'postgres'\" > Brewfile"
