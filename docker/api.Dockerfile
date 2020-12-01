FROM ruby:2.5.7

WORKDIR /code

COPY ./scripts/start_api.sh /scripts/start.sh
COPY ./scripts/test_api.sh /scripts/test.sh

RUN gem update --system
RUN gem install bundler
