FROM node:9.6-alpine
LABEL maintainer="Josh Mostafa <jmostafa@cozero.com.au>"

ENV ESLINT_VERSION=4.18.1

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && npm install -g eslint@${ESLINT_VERSION}

WORKDIR /app
VOLUME /app

COPY eslint.sh /eslint.sh
COPY .eslintrc.yaml /.eslintrc.yaml
ENTRYPOINT ["/eslint.sh"]
