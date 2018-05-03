#!/bin/bash

set -euo pipefail

echo "--- :eslint: ESLint JavaScript linting"

CMD=/linter/node_modules/.bin/eslint
CONFIG=""

if [ -e .eslintrc.js ] \
    || [ -e .eslintrc.json ] \
    || [ -e .eslintrc.yaml ] \
    || [ -e .eslintrc.yml ] \
    || [ -e .eslintrc ] \
    || grep --quiet eslintConfig package.json
then
  echo "--- :eslint: found project config"
else
  echo "--- :eslint: using default config"
  CONFIG="-c /linter/.eslintrc.yaml"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="--ext .jsx,.js ."
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $CONFIG $ARGS

echo "👌 LGTM!"
