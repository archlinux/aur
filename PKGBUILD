# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-cluster
_pyname=cluster
pkgver=1.3.3
pkgrel=1
pkgdesc="a package that allows to create several groups (clusters) of objects from a list"
url="https://github.com/exhuma/python-cluster"
arch=('any')
license=('LGPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/exhuma/python-cluster/archive/v1.3.3.tar.gz)
md5sums=('SKIP')

package() {
  cd python-${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}

