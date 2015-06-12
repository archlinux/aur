#!/bin/sh

# Aladin Bourne shell launcher
# P.Fernique [CDS] - F.Ochsenbein [CDS]
# V1.1 - oct 2010
# V1.0 - april 2009

# JAVA memory max allocation (in Mb)
mem=1024

prog=/usr/share/java/Aladin.jar

# Aladin launch
java -Xmx${mem}m -jar `dirname $prog`/Aladin.jar -script="setconf Dir=`pwd`;" $*
