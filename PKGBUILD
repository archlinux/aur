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
sha256sums=('a24e9447b92d19f5213a981db183264cb1a083ec357de74346bf5612249a1997')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
