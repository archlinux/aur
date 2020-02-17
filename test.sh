#!/bin/bash

OUTPUT=$(haur)

testEquality() {
  assertEquals $OUTPUT ""
}

. shunit2-2.1.6/src/shunit2
