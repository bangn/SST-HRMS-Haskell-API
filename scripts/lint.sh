#! /bin/bash

set -euo pipefail

curl -sSL https://raw.github.com/ndmitchell/neil/master/misc/travis.sh | sh -s -- hlint .
