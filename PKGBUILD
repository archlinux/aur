# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-templatetag-sugar
pkgver=0.1
pkgrel=2
pkgdesc="Django social authentication made simple.."
arch=(any)
url="http://pypi.python.org/pypi/django-templatetag-sugar/"
license=(BSD)
depends=(python2)
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(f5b8bf6e4cb82f8affa761574bf3dae4)

build () {
    
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}