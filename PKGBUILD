# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
pkgname=python2-omnijson
pkgver=0.1.2
pkgrel=6
pkgdesc="Selects the best installed JSON implementation available to Python."
arch=(any)
url="http://pypi.python.org/pypi/omnijson"
license=(MIT)
depends=(python2-simplejson)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/o/omnijson/omnijson-${pkgver}.tar.gz")
md5sums=('47c51c2e34275d7ad40ae6c826b7f001')

package () {

    cd "${srcdir}/omnijson-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/omnijson-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}