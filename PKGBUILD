# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-logan
pkgver=0.7.1
pkgrel=1
pkgdesc="A toolkit for building standalone Django applications."
arch=(any)
url="http://pypi.python.org/pypi/logan"
license=(Apache)
depends=(python2)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/l/logan/logan-${pkgver}.tar.gz")
md5sums=(513673ebd46986d8fb5a0e280c361291)

package () {
    
    cd "${srcdir}/logan-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
