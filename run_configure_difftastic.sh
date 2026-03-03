#!/bin/sh

set -eu

if command -v difft &>/dev/null; then
  git config set --global diff.external difft 
fi
