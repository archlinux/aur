#!/usr/bin/env sh

dir=$(mktemp -d)

ln -s /usr/lib/tp-dusk/dusk "$dir/dusk" && echo linked 1
ln -s /usr/share/tp-dusk/res "$dir/res" && echo linked 2
"/$dir/dusk" "$@"
wait
rmdir "$dir"
exit