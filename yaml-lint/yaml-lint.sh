#!/bin/bash

set -euo pipefail

echo "--- :yaml: YAML linting"

echo "--- Called with args::"
echo $@

CMD=/usr/local/bin/yamllint

if [ -e .yamllintrc ] || [ -e yamllintrc ] || [ -e .yamllintrc.yaml ] || [ -e yamllintrc.yaml ]
then
  echo "--- :yaml: found project config"
fi

$CMD "$@"

echo "👌 LGTM!"
