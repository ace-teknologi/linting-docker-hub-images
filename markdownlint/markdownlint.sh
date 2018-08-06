#!/bin/bash

set -euo pipefail

echo "--- :markdown: Markdown linting"

CMD=/linter/node_modules/.bin/markdownlint
CONFIG=""

if [ -e .markdownlint.json ]; then
  echo "--- :markdown: found project config"
else
  echo "--- :markdown: using default config"
  CONFIG="-c /linter/.markdownlint.json"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="/app/**/*.md"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
