# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-clamd
_pyname=pyClamd
pkgver=0.3.17
pkgrel=1
pkgdesc="a python interface to Clamd"
url="http://xael.org/pages/pyclamd-en.html"
arch=('any')
license=('LGPL3')
depends=('clamav' 'python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://xael.org/pages/${_pyname}-${pkgver}.tar.gz)
md5sums=('701e63618e04f94d956e99e43372cf84')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

