# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-templatetag-sugar
pkgver=1.0
pkgrel=2
pkgdesc="Django social authentication made simple.."
arch=(any)
url="http://pypi.python.org/pypi/django-templatetag-sugar/"
license=(BSD)
depends=(python2)
makedepends=(python2-distribute)
source=("https://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(40da36b5a4bf98fdff867f2ccd5bb34e)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
