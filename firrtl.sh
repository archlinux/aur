#!/bin/sh

java -cp /usr/share/scala/firrtl/firrtl.jar firrtl.stage.FirrtlMain ${@:1}
