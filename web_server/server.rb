require "sinatra";
require "sinatra/json"
require "redis"

### Redis client
redis = Redis.new(:host => "redis")
def add_entry_to_redis(redis)
  key = "#{rand(20000)}-foo" # Introduce new items on every endpoint call
  redis.set(key, "bar");
  p redis.get(key);
end

### Web server ###
set :bind, '0.0.0.0' # To make the endpoint available outside localhost
set :port, 80

get '/targets' do
  add_entry_to_redis(redis)
  json [
    { "targets": ["redis:6379"] }
  ]
end

run Sinatra::Application.run!