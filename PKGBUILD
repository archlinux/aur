# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="An in-process SQL OLAP database management system"
arch=('x86_64')
url="https://duckdb.org"
license=('MIT')
conflicts=('duckdb' 'duckdb-git')
source=("https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip")
sha256sums=('1b124c7d659810861967d65b2e0db3a0a92e399b695e3fef2d1bf844b6c9a549')
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
}
