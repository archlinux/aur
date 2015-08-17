# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
# Note: This is a fork fixing numerous bugs. You will not find this version
# in pypi.

pkgname=python2-pypcap
_pkgname=pypcap
pkgver=1.1.3
pkgrel=1
pkgdesc="A simplified object-oriented Python wrapper for libpcap"
arch=(any)
url="https://github.com/pynetwork/pypcap"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://github.com/pynetwork/$_pkgname/archive/v${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
md5sums=('2bb733983f96509401d23590b9ae745d')
