# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Niels Abspoel <aboe76 ad gmail dot com>

pkgname=python2-pysphere
_realname=pysphere
pkgver=0.1.8
pkgrel=1
pkgdesc="Python API for interacting with the vSphere Web Services SDK"
arch=(any)
url="https://github.com/argos83/pysphere"
license=('BSD')
depends=('python2')
source=("https://github.com/argos83/pysphere/archive/master.zip")
sha256sums=('bacea445090ef238fa56a10d1388acf2523058e93df88b40363b10741eca4325')

package() {
    cd ${srcdir}/${_realname}-master
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
