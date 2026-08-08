#!/bin/bash
xnviewmp_root=pkg/xnviewmp-system-libs/opt/xnviewmp
export LD_LIBRARY_PATH="${xnviewmp_root}/lib${LD_LIBRARY_PATH+:${LD_LIBRARY_PATH}}"
ldd -r "${xnviewmp_root}/XnView" "$@" | perl -nE '/undefined symbol: (\w+), version Qt_5/ && say "DEFINE_QT5_FORWARDER($1)"' | sort
