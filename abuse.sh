#!/bin/bash

# Copy over sane configuration files, unless they already exists
if [ ! -d $HOME/.abuse ]; then
  mkdir -p $HOME/.abuse
fi
if [ ! -f $HOME/.abuse/abuserc ]; then
  cp /usr/share/abuse/default.abuserc $HOME/.abuse/abuserc
fi
if [ ! -f $HOME/.abuse/gamma.lsp ]; then
  cp /usr/share/abuse/default.gamma.lsp $HOME/.abuse/gamma.lsp
fi

# Run abuse
exec /usr/bin/abuse.elf "$@"
