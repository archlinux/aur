# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-cluster
_pyname=cluster
pkgver=1.4.1
pkgrel=1
pkgdesc="a package that allows to create several groups (clusters) of objects from a list"
url="https://github.com/exhuma/python-cluster"
arch=('any')
license=('LGPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/exhuma/python-cluster/archive/v${pkgver}.tar.gz)
sha256sums=('e5f4479e618618d1e2866892cd85306e6377e738e057eeb12194359c0a563cce')

package() {
  cd python-${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}/" --prefix=/usr
}

