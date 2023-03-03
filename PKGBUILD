# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="An in-process SQL OLAP database management system"
arch=('x86_64')
url="https://duckdb.org"
license=('MIT')
conflicts=('duckdb' 'duckdb-git')
source=("https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip")
sha256sums=('ca44c8dceea83287ba2b22216344f432e706e2dafe27a8c8cfd9bfaf77f4767f')
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
}
