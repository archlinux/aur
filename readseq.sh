#!/bin/bash

for arg
do
  cmd="$cmd $arg"
done

if [ ${#cmd} -eq 0 ]; then
    java -cp /usr/share/java/readseq/readseq.jar app
  else 
    java -cp /usr/share/java/readseq/readseq.jar $cmd
fi

