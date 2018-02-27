#!/bin/bash

set -euo pipefail

echo "--- :sass: sass-lint SCSS/SASS linting"

CMD=/usr/local/bin/sass-lint 

if [ -e .sass-lint.yml ]
then
  echo "--- :sass: found project config file"
fi

$CMD -v

echo "👌 LGTM!"
