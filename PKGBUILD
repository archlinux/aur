# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

_pkgname=radicale-auth-seafile
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="Authenticate Radicale 2 requests against Seafile"
arch=('any')
url="https://github.com/klemens/radicale-auth-seafile"
license=('GPL3')
depends=('python'
         'python-psycopg2'
         'python-passlib'
         'radicale>=2')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9c23e60573ff9c8d339a3c1ad36790710e0d424373baa44c3273f8f48f4ffb57')

package() {
    cd "$srcdir/radicale-auth-seafile-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
