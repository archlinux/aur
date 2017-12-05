# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

_pkgname=radicale-auth-seafile
pkgname=python-$_pkgname
pkgver=0.1.2
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
sha256sums=('9dbe31136ff43b4408f6772635c5054815fa5b6654f732f2c2382f58d2651032')

package() {
    cd "$srcdir/radicale-auth-seafile-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
