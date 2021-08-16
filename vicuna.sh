#!/bin/sh
for name in /usr/share/java/vicuna/*.jar; do
  CP=$CP:$name
done
exec java -cp $CP cuploader.frames.FIntro "$@"
