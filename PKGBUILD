# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-crispy-forms
pkgver=1.6.1
pkgrel=1
pkgdesc="Django DRY forms."
arch=(any)
url="http://pypi.python.org/pypi/django-crispy-forms"
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
source=("https://pypi.python.org/packages/ef/f3/511b017c2cc3923bc3b317111fa230b0497d12ae3a9ed4c8c2237c07aef1/django-crispy-forms-${pkgver}.tar.gz#md5=84f6ceb0ecfac6ad049ec4cf35b24ee9")
md5sums=(84f6ceb0ecfac6ad049ec4cf35b24ee9)

package () {

    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
