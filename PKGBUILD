# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.15.0
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('becb9bcafe4cb36840f5e9e5a26489c7d6fd6e88e6d31c0d1b6410cbaa8f75e262c1a5c1517a7bfd52682809920d86258914db163639f6a494ca62d3453c976d')
b2sums_aarch64=('8b75b1b998ebce001780a4791749d695f305466bd78e206242c0e0cb7148ada25b01f795c4e36e5266b14b9d53ff3e438fe79484ff0f1d82f77c4aa116c29dfe')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
