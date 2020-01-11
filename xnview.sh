#!/bin/bash
xnviewmp_root=$(dirname "$(realpath "$0")")
export LD_PRELOAD="${xnviewmp_root}/lib/qt5_std_fun_forwarder.so${LD_PRELOAD+:${LD_PRELOAD}}"
exec "${xnviewmp_root}/XnView" "$@"
