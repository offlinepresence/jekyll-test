#!/usr/bin/env bash

# see http://nixos.org/nixpkgs/manual/#sec-language-ruby

mkdir -p .bundle && rm -vr .bundle

$(nix-build '<nixpkgs>' -A bundler)/bin/bundler lock
$(nix-build '<nixpkgs>' -A bundler)/bin/bundler package --path vendor/cache --no-install
$(nix-build '<nixpkgs>' -A bundix)/bin/bundix
