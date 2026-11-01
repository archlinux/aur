#!/bin/sh

export PYTHONPATH="/usr/share/smb3-foundry:$PYTHONPATH"
exec python3 /usr/share/smb3-foundry/smb3-scribe.py "$@"

