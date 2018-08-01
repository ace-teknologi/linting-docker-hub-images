#!/bin/bash

set -euo pipefail

echo "--- :scroll: Proselint"

CMD=/linter/node_modules/.bin/markdownlint
CONFIG=""

if [ -e .proselintrc ]; then
  echo "--- :scroll: found project config"
else
  echo "--- :scroll: using default config"
  CONFIG="-c /linter/.proselintrc"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="/app/*/*.md"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
