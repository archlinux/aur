_basename=nodm
pkgname=${_basename}-runit
pkgver=20201017
pkgrel=1
pkgdesc="runit service scripts for ${_basename}"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=("${_basename}")
conflicts=('systemd-sysvcompat')
source=("${_basename}.run")
sha256sums=('8f7a5d64f4ea88231b1a0e016611d5c92e5018b0d1ac5e9834a3b654abdb2435')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
