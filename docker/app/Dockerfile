ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG BUNDLER_VERSION

# Common dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

ARG APP_USER

ARG APP_HOME=/home/${APP_USER}/kitchenmate/api

RUN useradd -ms /bin/bash ${APP_USER}

WORKDIR ${APP_HOME}

# Install required Bundler version
RUN gem install bundler:$BUNDLER_VERSION

COPY . .

COPY docker/app/docker-entrypoint.sh /

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]