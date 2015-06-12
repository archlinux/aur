# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-social-auth-trello
pkgver=1.0.3
pkgrel=1
pkgdesc="A Sentry plugin that integrats with Trello."
arch=(any)
url="http://pypi.python.org/pypi/django-social-auth-trello"
license=(GPL)
depends=(python2)
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(71eec6f84bad80c366fccc5a682d061a)

build () {
    
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}