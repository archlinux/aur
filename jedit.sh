#!/bin/sh
# Run jEdit - Programmer's Text Editor

# If both $HOME/.jedit and $HOME/.jedit/properties doesn't exist,
# copy in a default property file.
if [ ! -e $HOME/.jedit ]; then
  if [ ! -e $HOME/.jedit/properties ]; then
    mkdir -p "$HOME/.jedit"
    cp /usr/share/jedit/default.props "$HOME/.jedit/properties"
  fi
fi

# Set the initial and maximum JVM heap size
JAVA_HEAP_MAX_SIZE=192

# Start jEdit
exec java -Xmx${JAVA_HEAP_MAX_SIZE}M -Dawt.useSystemAAFontSettings=lcd -jar /usr/share/java/jedit/jedit.jar "$@"
