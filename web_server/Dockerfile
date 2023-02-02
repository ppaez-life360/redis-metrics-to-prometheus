FROM ruby:2.7.6-slim

# Source code
COPY * ./

# Application dependencies
COPY Gemfile Gemfile.lock ./

RUN bundle install

#CMD ruby file
CMD ruby server.rb