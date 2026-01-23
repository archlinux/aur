# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.15.1
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('a661832f1e3a01c82a5aaf8580f5c3052478b106a87271e0d63a369a35413123b13914269e38586d0bf5dea67b4ffb5791540080225aa81d9d0dcf3b5215a9ac')
b2sums_aarch64=('2b3871f038ff989b5fa3c36fafef99cfd269d1bab74804bcf6705c2f74e1ef7bce8f98099b8d292acfe0a98a78ee5438076b092391a317508f707ffecb15fe2c')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
