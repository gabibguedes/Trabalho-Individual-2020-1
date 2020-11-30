FROM ruby:2.5.7

WORKDIR /code

RUN gem update --system
RUN gem install bundler