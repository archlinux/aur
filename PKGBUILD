# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >
_name=dblab
pkgname=${_name}-bin
pkgver=0.29.0
pkgrel=2
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('60809e5acb4a861155c619d2d5df6c441a6eb336d4f3cd0737026198abb50ec1')
license=('MIT')

package() {
    install -Dm 0755 $_name $pkgdir/usr/bin/$_name
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_name}/LICENSE
    install -Dm 0644 README.md $pkgdir/usr/share/doc/${_name}/README.md
}
