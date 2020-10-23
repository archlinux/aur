_basename=yacy
pkgname=${_basename}-runit
pkgver=20201023
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
sha256sums=('eb56b3a472dd99d4c26e8c065bac1f6f75c8d45dfe07f5d5393e8436ac13abab')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
