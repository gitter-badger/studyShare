FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

MAINTAINER Kevin Kawai

COPY . /var/www
WORKDIR /var/www

RUN bundle install

FROM node:8.9.4
RUN yarn install

EXPOSE 3000

ENTRYPOINT ["rails","s"]