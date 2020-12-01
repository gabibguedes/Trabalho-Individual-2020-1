FROM ruby:2.5.7

WORKDIR /code

COPY ./scripts/start_api.sh /scripts/start.sh

RUN gem update --system
RUN gem install bundler
