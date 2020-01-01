# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredric Johansson

_pipname=Flask-OpenID
pkgbase=python-flask-openid
pkgname=(python2-flask-openid)
pkgver=1.2.5
pkgrel=2
pkgdesc="A Flask extension for using openid authentication."
arch=(any)
url="http://pypi.python.org/pypi/Flask-OpenID"
license=(BSD)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('5a8ffe1c8c0ad1cc1f5030e1223ea27f8861ee0215a2a58a528cc61379e5ccab')

package_python2-flask-openid() {
depends=(python2-flask python2-openid)

    cd $_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
