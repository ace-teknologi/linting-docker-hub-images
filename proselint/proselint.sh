#!/bin/bash

set -euo pipefail

echo "--- :scroll: Proselint markdown files"

CMD=/usr/local/bin/proselint
CONFIG=""

if [ -e .proselintrc ]; then
  echo "--- :scroll: found project config"
else
  echo "--- :scroll: using default config"
  CONFIG="-c /linter/.proselintrc"
fi

if [ "$#" -gt 0 ]; then
  ARGS=($@)
else
  ARGS=""
fi

echo "--"

if [ -e $ARGS ]; then
  echo "--- :scroll: found file to lint $ARGS"
  $CMD $CONFIG $ARGS
else
  echo "--- :scroll: no file found"
fi

echo "👌 LGTM!"
