#!/bin/bash

set -euo pipefail

shopt -s nullglob

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
  ARGS=("/app/**/*.md")
fi

echo "Let's do this! Linting these files: {$ARGS[@]}"

echo "--"

for f in "{$ARGS[@]}"
do
  echo "Proselinting $f"
  $CMD $CONFIG $f
  echo "--"
done

shopt -u nullglob

echo "👌 LGTM!"
