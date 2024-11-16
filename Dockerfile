FROM ruby:3.2.2-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y build-essential git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler

# Copy gemspec and Gemfile
COPY loading_buddy.gemspec Gemfile ./
COPY lib/loading_buddy/version.rb lib/loading_buddy/

# Install dependencies
RUN bundle install

COPY . .
