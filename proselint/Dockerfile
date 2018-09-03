FROM python:3.6-alpine3.7
LABEL maintainer="Joel Courtney <jcourtney@cozero.com.au>"

ENV PROSELINT_VERSION=0.10.2

RUN apk add --update bash \
  && rm -rf /var/cache/apk/* \
  && pip3 install -U proselint==${PROSELINT_VERSION}

WORKDIR /app
VOLUME /app

COPY proselint.sh /linter/proselint.sh
COPY .proselintrc ~/.config/proselint/config
COPY .proselintrc /linter/.proselintrc

ENTRYPOINT [ "/linter/proselint.sh" ]
