require "redis"
require "redis-rails"

# Set up a Redis connection globally
$redis = Redis.new(url: ENV.fetch("REDIS_URL", "redis://localhost:6379/0"))
