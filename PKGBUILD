# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Niels Abspoel <aboe76 ad gmail dot com>

pkgname=python2-pysphere
_realname=pysphere
pkgver=0.1.8
pkgrel=1
pkgdesc="Python API for interacting with the vSphere Web Services SDK"
arch=(any)
url="http://pysphere.googlecode.com"
license=('BSD')
depends=('python2')
source=("http://pysphere.googlecode.com/files/${_realname}-${pkgver}.zip")
md5sums=('c57cba33626ac4b1e3d1974923d59232')

package() {
    cd ${srcdir}/${_realname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
