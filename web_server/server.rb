require "sinatra";
require "sinatra/json"
require "redis"

### Redis client

redis = Redis.new(:host => "redis")

### Web server ###
set :bind, '0.0.0.0' # To make the endpoint available outside localhost
set :port, 80

get '/targets' do
  key = "#{rand(20000)}-foo" # Introduce new items on every endpoint call
  redis.set(key, "bar");
  p redis.get(key);

  json [
    { "targets": ["redis:6379"] }
  ]
end

run Sinatra::Application.run!