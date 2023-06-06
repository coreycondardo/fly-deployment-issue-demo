require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load dotenv only in development or test environment
if ['development', 'test'].include? ENV['RAILS_ENV']
  Dotenv::Railtie.load
end

HOSTNAME = ENV['HOSTNAME']

module Quadbunt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.session_store :cookie_store, key: 'daf856b9d0c8423dced64206b73dfcf41ed5564a6281692747fba3409535590770ae18c273315239b23ac03fcc431db0797cf9be79b49bc1e391e56d5565c0ba'

    if Rails.env.development?
      require 'pry'
      config.console = Pry
    end
  end
end
