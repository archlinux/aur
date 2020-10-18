_basename=xboxdrv
pkgname=${_basename}-runit
pkgver=20201018
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
sha256sums=('4e17337aaa018bbd616ad74d1f32fd0063e32754ce92c2235e008d54f3f10d75')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
