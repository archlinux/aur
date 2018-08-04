# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-phply
_pyname=phply
pkgver=1.2.5
pkgrel=1
pkgdesc="Lexer and parser for PHP source implemented using PLY"
url="https://github.com/viraptor/phply"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/viraptor/${_pyname}/archive/${pkgver}.tar.gz)
md5sums=('f6c0e4014fe70c6436984c07da836ae1')

package() {
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}
