#!/bin/bash

set -euo pipefail

echo "--- :coffeelint: coffeelint coffee linting"

CMD=/usr/local/bin/coffeelint 

if [ -e coffeelint.json ]
then
  echo "--- :coffeelint: found project config file"
  $CMD -f coffeelint.json -r .
else
  $CMD -f /coffeelint.json -r .
fi

echo "👌 LGTM!"
