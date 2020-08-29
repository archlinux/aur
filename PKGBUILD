_basename=matrix-appservice-irc
pkgname=${_basename}-runit
pkgver=20200829
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
sha256sums=('1410698fde5f761bdbfa0c976ab1b424e692491c0c1d7d0ccf3f1bcda2af2502')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
