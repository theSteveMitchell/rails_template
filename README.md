# rails_template
An ideal template for a new rails project

This is just a template for a new rails project, based on the conventions I used 80+ % of the time.

# Usage
rails new <app_name> -m https://raw.githubusercontent.com/theSteveMitchell/rails_template/master/rails_template.rb

#What it does

1. replaces your Gem source with a local gem repository (some companies will do this)
2. Install some default gems for dev and test group (rspec, spring-commands-rspec, pry, rubocop, factory_girl, rails_config, after_party)
3. init's your git repo and creates the new project.
4. replaces the rails default rdoc with an example markdown file.
5. removes test directory and installs rspec instead
6. installs rails_config
7. creates a .ruby-version file and .ruby-gemset (using app_name and current ruby version)
8. installs my awesome bin/setup script
9. creates a Brewfile with just postgres
