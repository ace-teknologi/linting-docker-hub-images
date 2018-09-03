FROM node:10.9-alpine
LABEL maintainer="Josh Mostafa <jmostafa@cozero.com.au>"

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && npm install npm@latest -g

WORKDIR /app
COPY . /app

# Move linter files to /linter dir so that they won't get overwritten
# when files get mounted into /app
RUN mkdir /linter \
  && mv eslint.sh /linter/eslint.sh \
  && mv .eslintrc.yaml /linter/.eslintrc.yaml \
  && npm install \
  && mv node_modules /linter

ENTRYPOINT ["/linter/eslint.sh"]
