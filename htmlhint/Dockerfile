FROM node:10.9-alpine
LABEL maintainer="J Nagel <jnagel@cozero.com.au>"

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && npm install npm@latest -g

WORKDIR /app
COPY . /app

# Move linter files to /linter dir so that they won't get overwritten
# when files get mounted into /app
RUN mkdir /linter \
  && mv htmlhint.sh /linter/htmlhint.sh \
  && npm install \
  && mv node_modules /linter

ENTRYPOINT ["/linter/htmlhint.sh"]
