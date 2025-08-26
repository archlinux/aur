# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.9.16
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('f347c79e73d8750e8cb1ed7f547ecd8f1ebcfaf9529cb6a95e384438ee8362ea0c91079c596d971531abae99c372362c1538f7752b3ed99928083f22afcb4939')
b2sums_aarch64=('f347c79e73d8750e8cb1ed7f547ecd8f1ebcfaf9529cb6a95e384438ee8362ea0c91079c596d971531abae99c372362c1538f7752b3ed99928083f22afcb4939')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
