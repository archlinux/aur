!#/bin/bash
dir="$(cd "$(dirname "$0")"; pwd)";
export PATH=$dir:$PATH
$dir/scrcpy_binary $@
