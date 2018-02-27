#!/bin/bash

set -euo pipefail

echo "--- :rubocop: rubocop ruby linting"

/usr/local/bundle/bin/rubocop "$@"

echo "👌 LGTM!"
