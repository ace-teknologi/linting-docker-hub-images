#!/bin/bash

set -euo pipefail

echo "--- :markdown: remark-linting"

CMD=/linter/node_modules/.bin/remark
CONFIG=""

if [ -e .remarkrc ]; then
  echo "--- :markdown::scroll: found project config"
else
  echo "--- :markdown::scroll: using default config"
  CONFIG="--rc-path /linter/.remarkrc"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="/app/*/*.md"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
