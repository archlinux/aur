#!/bin/sh

java -cp /usr/share/scala/firrtl-git/firrtl.jar firrtl.Driver ${@:1}
