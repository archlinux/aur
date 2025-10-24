# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >
_name=dblab
pkgname=${_name}-bin
pkgver=0.34.2
pkgrel=1
provides=("$_name")
conflicts=("$_name")
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cc5bb0ec1e5777433480e151f2925a1af9d5f61d34d1b111ecba019bcee7f346')
license=('MIT')

package() {
    install -Dm 0755 $_name $pkgdir/usr/bin/$_name
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_name}/LICENSE
    install -Dm 0644 README.md $pkgdir/usr/share/doc/${_name}/README.md
}
