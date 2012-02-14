require 'spec_helper'
require 'capybara/rspec'

# Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 5

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

