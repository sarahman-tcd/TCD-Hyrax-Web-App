FROM ruby:2.7.4

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler -v 2.1.4

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs 4 --retry 3

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
