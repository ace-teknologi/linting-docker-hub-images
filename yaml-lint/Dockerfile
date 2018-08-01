FROM python:3.6.4-alpine
LABEL maintainer="Joel Courtney <jcourtney@cozero.com.au>"

ENV YAMLLINT_VERSION=1.11.1

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && pip3 install -U yamllint==${YAMLLINT_VERSION}

WORKDIR /app
VOLUME /app

COPY yaml-lint.sh /yaml-lint.sh
COPY yamllintrc.yaml /etc/yamllintrc.yaml
ENTRYPOINT ["/yaml-lint.sh"]
