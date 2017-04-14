# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-esmre
_pyname=esmre
pkgver=0.3.1
pkgrel=1
pkgdesc="a Python module that can be used to speed up the execution of a large collection of regular expressions"
url="https://github.com/wharris/esmre"
arch=('any')
license=('LGPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/50/b0/17401277ddaa334622c047f9c9a083956e67f8b08c7b8b43ade0b588f349/${_pyname}-${pkgver}.tar.gz)
md5sums=('95ace12bac0c79cf95712336489bc4a4')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}

