# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname='python-mongoengine'
pkgver=0.10.5
pkgrel=1
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python')
source=(https://pypi.python.org/packages/source/m/mongoengine/mongoengine-${pkgver}.tar.gz)
sha256sums=('b1a460d76e9212f201bab12bc338c99ddd7c6ec5a4389835324d9ee81d42d640')

check() {
  cd ${srcdir}/mongoengine-${pkgver}
  python setup.py check
}

package_python-mongoengine() {
	cd ${srcdir}/mongoengine-${pkgver}
  python setup.py install --root "${pkgdir}" --optimize=1
}
