# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.9.11
pkgrel=2
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('f65f695164b09f444639e331c34df9ae544fb7d9f52c6caf5c13c7dba9bbf731e73ec0bd2f5cb37e4896399040370856d8ea7c9af4b7aab0cad0a202495311a8')
b2sums_aarch64=('f65f695164b09f444639e331c34df9ae544fb7d9f52c6caf5c13c7dba9bbf731e73ec0bd2f5cb37e4896399040370856d8ea7c9af4b7aab0cad0a202495311a8')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
