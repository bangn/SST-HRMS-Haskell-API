#! /bin/bash

set -euo pipefail

if [ -z "$STACK_YAML" ]; then
  export PATH="/opt/ghc/$GHCVER/bin:/opt/cabal/$CABALVER/bin:$PATH"
  echo "$PATH"
  cabal new-update
  cabal new-build --enable-tests --enable-benchmarks
else
  mkdir -p ~/.local/bin
  export PATH="$HOME/.local/bin:$PATH"
  travis_retry curl -L 'https://www.stackage.org/stack/linux-x86_64' | tar xz --wildcards --strip-components=1 -C ~/.local/bin '*/stack'
  stack --version
  stack setup --no-terminal --install-cabal 2.2.0.1
  stack ghc -- --version
  stack build --only-dependencies --no-terminal
fi
