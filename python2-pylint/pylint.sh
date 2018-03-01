#!/bin/bash

set -euo pipefail

echo "--- :python: Pylint (Python 2) linting"

echo "--- Called with args::"
echo $@

CMD=/usr/local/bin/pylint 

if [ -e .pylintrc ] || [ -e pylintrc ]
then
  echo "--- :python: found project config"
fi

$CMD "$@"

echo "👌 LGTM!"
