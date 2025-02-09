require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false

    # Redis as the cache store
    config.cache_store = :redis_cache_store, {
      url: ENV.fetch("REDIS_URL", "redis://redis:6379/0"),
      namespace: "cache",  # Prevents key collisions
      expires_in: 90.minutes
    }
    # Ensure Redis-backed session storage is correctly configured
    config.session_store :redis_store, servers: [
      ENV.fetch("REDIS_URL", "redis://redis:6379/0")
    ], expire_after: 90.minutes, key: "_cart_session"
  end
end
