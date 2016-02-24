# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname='python-mongoengine'
pkgver=0.10.6
pkgrel=1
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python')
source=(https://pypi.python.org/packages/source/m/mongoengine/mongoengine-${pkgver}.tar.gz)
sha256sums=('007e3ac452c0a670e89c1d9755f7ddfc2f10982e6edda555e3671ee4cf7b12a5')

check() {
  cd ${srcdir}/mongoengine-${pkgver}
  python setup.py check
}

package_python-mongoengine() {
	cd ${srcdir}/mongoengine-${pkgver}
  python setup.py install --root "${pkgdir}" --optimize=1
}
