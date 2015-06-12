# Maintainer: Benjamin A. Shelton <zancarius at gmail _ com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-social-auth
pkgver=0.7.28
pkgrel=1
pkgdesc="Social authentication made simple."
arch=(any)
url="http://pypi.python.org/pypi/django-social-auth"
license=(BSD)
depends=(python2 python2-openid python2-oauth2)
makedepends=(python2-distribute)
conflicts=(django-socialauth-git)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(50fb14cc829fc28d6021e711e206f228)

package () {
    
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}