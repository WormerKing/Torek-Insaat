FROM ruby:3.2.0

RUN apt update -y && apt upgrade -y && apt install -y nodejs postgresql-client build-essential npm && npm install --global yarn

WORKDIR /app

COPY . /app

COPY Gemfile* ./app

RUN bundle install && bundle update

RUN bin/rails db:create && bin/rails db:migrate && bin/rails db:seed