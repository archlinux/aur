#!/bin/sh

exec /usr/bin/java -Densime.config=${1:-.}/.ensime -cp /usr/lib/jvm/default/lib/tools.jar:/usr/lib/ensime/ensime_2.11.6-0.9.10-SNAPSHOT-assembly.jar org.ensime.server.Server
