#!/bin/sh

set -euo pipefail

echo "--- :html: htmlhint HTML linting"

CMD="/linter/node_modules/.bin/htmlhint"

if [ -e .htmlhintrc ]
then
  echo "--- :html: found project config file"
fi

if [ "$#" -gt 0 ]; then
  ARGS=$@
else
  ARGS="**/*.html"
fi

echo "Let's do this! Linting these files: $ARGS"

$CMD $ARGS

echo "👌 LGTM!"
