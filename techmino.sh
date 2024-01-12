#!/bin/bash

cd "$(dirname "$(realpath "$0")")"
exec love techmino.love "$@"
