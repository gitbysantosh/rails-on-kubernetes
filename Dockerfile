# Use an Alpine-based Ruby image
FROM ruby:2.7.2-alpine

# Install necessary packages
RUN apk --update add nodejs netcat-openbsd postgresql-dev build-base

# Set the working directory
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

