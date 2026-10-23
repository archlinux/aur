#!/bin/sh
# ReAgent ships its own virtualenv under /opt because Arch's python is 3.14
# while RDKit, ONNX Runtime and AiZynthFinder cap out at 3.12. Exec the venv's
# own entry point so click sees the right argv[0].
export REAGENT_DATA="${REAGENT_DATA:-${XDG_DATA_HOME:-$HOME/.local/share}/reagent}"
exec /opt/reagent/bin/reagent "$@"
