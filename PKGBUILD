# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-crispy-forms
pkgver=1.6.0
pkgrel=2
pkgdesc="Django DRY forms."
arch=(any)
url="http://pypi.python.org/pypi/django-crispy-forms"
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
source=("https://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(cf9537e0d2e5150644f45ea966b106dc)

package () {

    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
