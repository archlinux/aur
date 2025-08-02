#!/bin/sh
cd "$(dirname "$0")"
ln -sf ../../pre-commit .git/hooks/pre-commit
