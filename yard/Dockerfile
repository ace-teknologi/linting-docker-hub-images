FROM ruby:2.3-alpine
LABEL maintainer="Joel Courtney <jcourtney@cozero.com.au>"

ENV YARD_VERSION=0.9.12

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && gem install yard -v ${YARD_VERSION}

WORKDIR /app
VOLUME /app

COPY yard.sh /yard.sh
COPY yard-server.sh /yard-server.sh
ENTRYPOINT ["/yard.sh"]
