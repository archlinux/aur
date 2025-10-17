# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >
_name=dblab
pkgname=${_name}-bin
pkgver=0.34.0
pkgrel=1
provides=("$_name")
conflicts=("$_name")
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b284a183e58111d3e86578f21f74c4f1ae94d36507a33deb862b5b142e5e6d75')
license=('MIT')

package() {
    install -Dm 0755 $_name $pkgdir/usr/bin/$_name
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_name}/LICENSE
    install -Dm 0644 README.md $pkgdir/usr/share/doc/${_name}/README.md
}
