# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-clamd
_pyname=pyClamd
pkgver=0.4.0
pkgrel=1
pkgdesc="a python interface to Clamd"
url="http://xael.org/pages/pyclamd-en.html"
arch=('any')
license=('LGPL3')
depends=('clamav' 'python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://xael.org/pages/${_pyname}-${pkgver}.tar.gz)
md5sums=('176b00f50236fa11eaf1eb75ec8055d8')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

