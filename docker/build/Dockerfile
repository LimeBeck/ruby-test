FROM ruby:2.7.4-alpine

ARG BUNDLER_VERSION=2.2.17
ENV RAILS_ENV=production

RUN apk add --update alpine-sdk nodejs yarn postgresql-dev tzdata && rm -rf /var/cache/apk/*

RUN gem install bundler -v ${BUNDLER_VERSION}

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --without development test

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . ./

RUN ./bin/rails webpacker:install && ./bin/rails assets:precompile

ENTRYPOINT [ "./docker/build/server_entrypoint.sh" ]