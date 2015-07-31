# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=ofxstatement-austrian
pkgver=0.0.2
pkgrel=1
pkgdesc='A plugin for ofxstatement to convert proprietary banking statements to OFX.'
arch=('any')
url="https://github.com/nblock/ofxstatement-austrian"
license=('GPL3')
depends=('python' 'ofxstatement')
source=(https://pypi.python.org/packages/source/o/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('80efccab45fac07986918bf2c5eddd0f')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # build
  python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
