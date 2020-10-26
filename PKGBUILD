_basename=mautrix-telegram
pkgname=${_basename}-runit
pkgver=20200829
pkgrel=1
pkgdesc="runit service scripts for ${_basename}"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=("${_basename}-git")
conflicts=('systemd-sysvcompat')
source=("${_basename}.run")
sha256sums=('5b5b801c9bedf7cdfedfe0c36109abf4fd9fab919292b240b2273a1da28dbafc')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
