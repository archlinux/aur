#!/bin/sh
# Print a fortune cookie for interactive shells:
if [[ $- = *i* ]]; then
  echo
  fortune -a
  echo
fi


