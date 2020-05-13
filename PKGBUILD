# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Laszlo Papp <dj szapi at archlinux us>
# Contributor: Benjamin A. Shelton <zancarius -at- gmail.com>

pkgname=python2-openid
pkgver=2.2.5
pkgrel=5
pkgdesc="OpenID library for Python"
arch=(any)
url="https://pypi.python.org/pypi/python-openid"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/python-openid/python-openid-${pkgver}.tar.gz")
sha512sums=('e1dc649153239ec128c26e55587c909e45bc46ee7c2878b0f1541de135f4d3d299710678d3913bb978dd9a9167fda89bff72705efdd1cfda435290e5dc0dab5a')

package() {
    cd python-openid-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
