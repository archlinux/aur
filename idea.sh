#!/bin/bash

(
  trap - SIGINT
  exec /bin/bash /usr/bin/idea.sh "$@"
) &
