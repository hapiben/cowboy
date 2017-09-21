FROM ruby:2.4.1
MAINTAINER info@boost.co.nz

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
COPY Gemfile* /cowboy/
WORKDIR /cowboy
RUN bundle install

ENV app /cowboy
RUN mkdir -p $app
WORKDIR $app
ADD . $app

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD bundle exec puma --bind tcp://0.0.0.0:3000