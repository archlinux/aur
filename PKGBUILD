# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-esmre
_pyname=esmre
pkgver=0.5.2
pkgrel=1
pkgdesc="a Python module that can be used to speed up the execution of a large collection of regular expressions"
url="https://github.com/wharris/esmre"
arch=('any')
license=('LGPL2')
depends=('python2')
makedepends=('python2-setuptools' 'cython2')
source=(${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/96/99/5f6882cdb32708711b7724fee76eb6ce44033309ed0b12f71da1731e7d22/${_pyname}-${pkgver}.tar.gz)
md5sums=('ce26e9bf8bfeb3f469d68b3fccd70939')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}

