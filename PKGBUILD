# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname='python-mongoengine'
pkgver=0.10.0
pkgrel=1
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python')
source=(https://pypi.python.org/packages/source/m/mongoengine/mongoengine-${pkgver}.tar.gz)
sha256sums=('37d3e37d7d9319b26541e8b1006444f1f3a0c74cfa0d56abec764f2fa47bae6c')

check() {
  cd ${srcdir}/mongoengine-${pkgver}
  python setup.py check
}

package_python-mongoengine() {
	cd ${srcdir}/mongoengine-${pkgver}
  python setup.py install --root "${pkgdir}" --optimize=1
}
