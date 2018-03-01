#!/bin/bash

set -euo pipefail

echo "--- :eslint: ESLint JavaScript linting"

CMD=/usr/local/bin/eslint 

if [ -e .eslintrc.js ] \
    || [ -e .eslintrc.json ] \
    || [ -e .eslintrc.yaml ] \
    || [ -e .eslintrc.yml ] \
    || [ -e .eslintrc ] \
    || grep --quiet eslintConfig package.json
then
  echo "--- :eslint: found project config"
  $CMD --ext .jsx,.js .
else
  $CMD -c /.eslintrc.yaml --ext .jsx,.js .
fi

echo "👌 LGTM!"
