#! /bin/bash

set -eo pipefail

if [ -z "$STACK_YAML" ]; then
  cabal new-test
else
  stack build --test --bench --no-run-benchmarks --no-terminal --ghc-options=-Werror
fi
