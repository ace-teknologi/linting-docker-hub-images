#!/bin/bash

set -euo pipefail

echo "--- :books: YARD missing docs"

/usr/local/bundle/bin/rubocop "$@"

echo "👌 LGTM!"
