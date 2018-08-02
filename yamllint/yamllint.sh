#!/bin/bash

set -euo pipefail

echo "--- :yaml: YAML linting"

CMD="/usr/local/bin/yamllint"
CONFIG=""
ARGS="."

if [ -e .yamllintrc ] || [ -e yamllintrc ] || [ -e .yamllintrc.yaml ] || [ -e yamllintrc.yaml ]
then
  echo "--- :yaml: found project config"

  if [ -e .yamllintrc ]; then
    CONFIG="-c .yamllintrc"
  fi

  if [ -e yamllintrc ]; then
    CONFIG="-c yamllintrc"
  fi

  if [ -e .yamllintrc.yaml ]; then
    CONFIG="-c .yamllintrc.yaml"
  fi

  if [ -e yamllintrc.yaml ]; then
    CONFIG="-c yamllintrc.yaml"
  fi
else
  CONFIG="-c /etc/yamllintrc.yaml"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
fi

echo "Let's do this! Linting these files: $ARGS"
echo "  with config: $CONFIG"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
