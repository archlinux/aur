# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
_pkgname=virtualfish
pkgname=python2-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python2-virtualenv')
options=(!emptydirs)
install=
source=("https://github.com/adambrenecki/$_pkgname/archive/$pkgver.tar.gz")
sha1sums=("3208677e4072cbe11529ab217acbb68a2cc7b829")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
