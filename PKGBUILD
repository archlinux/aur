# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-crispy-forms
pkgver=1.4.0
pkgrel=1
pkgdesc="Django DRY forms."
arch=(any)
url="http://pypi.python.org/pypi/django-crispy-forms"
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(b4bc5932405039839e6a99ecf95d30d7)

package () {

    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
