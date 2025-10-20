# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >
_name=dblab
pkgname=${_name}-bin
pkgver=0.34.1
pkgrel=1
provides=("$_name")
conflicts=("$_name")
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7bca40ddbec148812cd28e5a6ca677fc24a89648de6ffbac57cee3855197d6d4')
license=('MIT')

package() {
    install -Dm 0755 $_name $pkgdir/usr/bin/$_name
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_name}/LICENSE
    install -Dm 0644 README.md $pkgdir/usr/share/doc/${_name}/README.md
}
