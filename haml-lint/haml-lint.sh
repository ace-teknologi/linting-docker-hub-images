#!/bin/bash

set -euo pipefail

echo "--- :haml: HAML linting"

CMD=/usr/local/bundle/bin/haml-lint

if [ -e .haml-lint.yml ]
then
  # Note: no need to explicitly call with this config as it is automatically
  # used if found in the directory in which haml-lint run.
  # Ref: https://github.com/brigade/haml-lint#configuration
  echo "--- :haml: found project config file"
fi

$CMD .

echo "👌 LGTM!"
