# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=ofxstatement-austrian
pkgver=0.0.4
pkgrel=1
pkgdesc='A plugin for ofxstatement to convert proprietary banking statements to OFX.'
arch=('any')
url="https://github.com/nblock/ofxstatement-austrian"
license=('GPL3')
depends=('python' 'ofxstatement')
source=(https://pypi.python.org/packages/54/00/62748e5f31fb6c61add92d2dbdba4af5fce5adc7dd558170f1c4144f2f0a/$pkgname-$pkgver.tar.gz)
md5sums=('4ff2bd86da548be989f828608f2e5a6e')
sha1sums=('de7bd9638c63f0d4c49536705919bd2b9465e581')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # build
  python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
