#!/bin/sh
# spcomp in SourceMod's scripting folder, run by its path: it finds the include folder next to the path
# it was run by, so plugins compile with SourceMod's include files and those of the installed plugins
# and extensions without -i
exec /usr/lib/sourcemod/addons/sourcemod/scripting/spcomp64 "$@"
