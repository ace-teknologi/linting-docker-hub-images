#!/bin/bash

set -euo pipefail

echo "--- :css: stylelint SASS/SCSS/CSS linting"

CMD="/linter/node_modules/.bin/stylelint"
CONFIG=""

if [ -e .stylelintrc ] \
    || [ -e stylelint.config.js ] \
    || grep --quiet stylelint package.json
then
  echo "--- :css: found project config file"
else
  CONFIG="--config /linter/.stylelintrc"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="**/*.scss"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
