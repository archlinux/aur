# This scripts is used by developers to ease releases

set -e

if [[ ! -e PKGBUILD ]]; then
  >&2 echo "PKGBUILD not found"
  exit 1
fi

_ver=`sed -n "s/^pkgver='\(.*\)'/\1/p" PKGBUILD`
_rel=`sed -n 's/^pkgrel=\(.\)/\1/p' PKGBUILD`

command="git commit -m 'v${_ver}-${_rel}'"

echo "Confirm the command (Y/N): $command"
read confirm

[ "$confirm" != "Y" ] && [ "$confirm" != "y" ]  && echo "Aborting" && exit 1

bash -c "$command"
