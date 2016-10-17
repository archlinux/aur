#!/bin/sh
java=/usr/bin/java
dir=/usr/share/mesquite

cp -r  "$dir/../Resources/com/"* "$dir/com/" >& /dev/null
$java -Djava.library.path=lib -Djri.ignore.ule="yes" -cp "$dir" mesquite.Mesquite $*


