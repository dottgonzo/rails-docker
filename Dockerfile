FROM ruby:2.4-slim
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs mysql-client libpq-dev libmysqlclient-dev imagemagick libsqlite3-dev
CMD [ "bundle", "exec", "puma", "--bind", "tcp://0.0.0.0:3000" ]
EXPOSE 3000
