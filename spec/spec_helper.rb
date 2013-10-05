# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'capybara/rspec'
require 'bundler/setup'
require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Capybara::DSL

end

