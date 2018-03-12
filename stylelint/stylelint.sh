#!/bin/sh

set -euo pipefail

echo "--- :css: stylelint SASS/SCSS/CSS linting"

CMD="/linter/node_modules/.bin/stylelint"

if [ -e .stylelintrc ] \
    || [ -e stylelint.config.js ] \
    || grep --quiet stylelint package.json
then
  echo "--- :css: found project config file"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="**/*.scss"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $ARGS

echo "👌 LGTM!"
