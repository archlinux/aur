#!/bin/sh

docker run -it -v "$(pwd)":"$(pwd)" -w "$(pwd)" archbuiler "$@"
