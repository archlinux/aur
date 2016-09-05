#!/usr/bin/bash

set -e

# This CGI script is a caching Arch Linux mirror proxy: it forwards new package
# requests to an actual mirror while caching contents to /var/cache/pacman/pkg.
# Use in pacman.conf with:
# 
# 	Server = http://server/path/to/proxy.cgi/$repo/os/$arch/

[[ $REMOTE_ADDR = 127.0.0.1 ]]

cd /var/cache/pacman/pkg

touch used-by-proxy

MIR=$(awk -F '[$=]' '(!/^#/){print$2;exit}' /etc/pacman.d/mirrorlist)

MIR=${MIR# }

[[ $PATH_INFO = /vesath/* ]] &&
MIR='http://arch.vesath.org'

PKG=${PATH_INFO##*/}

[[ $PKG = *.db* ]] &&
exec curl --silent --include "${MIR# }$PATH_INFO"

cat <<EOF
Content-Type: application/octet-stream
Connection: close

EOF

[[ -s $PKG ]] &&
exec cat "$PKG"

curl --silent "$MIR$PATH_INFO" |
tee "$PKG.part"

mv "$PKG.part" "$PKG"
