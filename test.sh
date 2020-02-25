#!/usr/bin/env bash

testEquality() {
  if ./haur -g &>/dev/null; then
    echo "Test failed"
    exit 1
  else
    echo "Test successful"
    exit 0
  fi
}

testEquality
