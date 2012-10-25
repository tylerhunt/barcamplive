require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'sprockets/railtie'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module BarCampLive
  class Application < Rails::Application
    # Defaults
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]
    config.time_zone = 'Eastern Time (US & Canada)'

    # Assets
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
