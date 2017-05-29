# Maintainer: Peter van den Hurk <runical at gmx dot com>
pkgname=mopidy-simple-webclient
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple and minimalistic Mopidy HTTP client"
arch=('any')
url="https://github.com/xolox/mopidy-simple-webclient"
license=('MIT')
depends=('mopidy')
makedepends=('python2-setuptools')
source=(https://github.com/xolox/$pkgname/archive/$pkgver.tar.gz)
md5sums=('3b1ab248751ed2c2c59e1823406122e3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
