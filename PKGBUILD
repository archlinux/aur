# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

_pkgname=radicale-auth-seafile
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="Authenticate Radicale 2 requests against Seafile"
arch=('any')
url="https://github.com/klemens/radicale-auth-seafile"
license=('GPL3')
depends=('python'
         'python-psycopg2'
         'python-passlib'
         'python-setuptools'
         'radicale>=2')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1962771087ef6fad4b0363707d5aeac6d2bb95005c47a203734224c26802b6d8')

package() {
    cd "$srcdir/radicale-auth-seafile-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
