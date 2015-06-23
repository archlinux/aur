#!/bin/sh
cd /usr/share/java/w3c-css-validator
for name in /usr/share/java/w3c-css-validator/*.jar ; do
  CP=$CP:$name
done
"$JAVA_HOME/bin/java" -cp $CP org.w3c.css.css.CssValidator $*
