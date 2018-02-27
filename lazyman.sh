#!/usr/bin/env bash

cpath=/usr/share/java/lazyman/lib
java -cp \
    $cpath/gson-2.7.jar:$cpath/jcalendar-1.4.jar:$cpath/AppleJavaExtensions-1.4.jar:/usr/share/java/lazyman/LazyMan.jar \
    lazyman.LazyMan
