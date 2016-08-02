# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-logan
pkgver=0.7.2
pkgrel=1
pkgdesc="A toolkit for building standalone Django applications."
arch=(any)
url="http://pypi.python.org/pypi/logan"
license=(Apache)
depends=(python2)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/a8/65/bf3fac81af756595a5302c05625c1955f817631abc961b034ff4d4077f53/logan-0.7.2.tar.gz#md5=6b0300ada1dcfd00ea7faef5f27a65a8")
md5sums=(6b0300ada1dcfd00ea7faef5f27a65a8)

package () {
    cd "${srcdir}/logan-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
