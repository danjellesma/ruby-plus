# Rubyslim
# A slim ruby image based on Alpine Linux ready for Rails
# - Postgres and SQLite3 libraries
# - Nodejs for Javascript runtime
# - Bash for better shell
# - TZData for timezone support
# - Nokogiri working with 1.6.8+
#
# Version 2.5.1

FROM ruby:2.5.1-alpine
LABEL MAINTAINER "Dan Jellesma"

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base nodejs
ENV RUBY_PACKAGES libc6-compat tzdata
ENV DB_PACKAGES postgresql-dev sqlite-dev

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    apk add $DB_PACKAGES && \
    rm -rf /var/cache/apk/*
