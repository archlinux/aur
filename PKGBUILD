# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.12.10
pkgrel=2
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('5427fdc5bd0a2cfac43973c82484e0b19486ed4cf73d3c7c341c4d7e579abbf9b16d0401d4b405dfa4d5fb206750997c25deeec9a16450ea0e418b22d5577250')
b2sums_aarch64=('5427fdc5bd0a2cfac43973c82484e0b19486ed4cf73d3c7c341c4d7e579abbf9b16d0401d4b405dfa4d5fb206750997c25deeec9a16450ea0e418b22d5577250')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
