FROM ruby:2.4-slim
WORKDIR /app
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs mysql-client libmysqlclient-dev imagemagick libsqlite3-dev
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app
RUN mkdir -p /app/public/system/uploaded
CMD [ "bundle", "exec", "puma", "--bind", "tcp://0.0.0.0:3000" ]
EXPOSE 3000
