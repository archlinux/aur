#!/bin/sh

java -cp /usr/share/scala/firrtl/firrtl.jar firrtl.Driver ${@:1}
