# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.9.17
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('ef521aa31ebfa5b60db6a1c0c133160f1e40073dac334f09cc8b289619705d543c8ea4151dda6eb4d9120d683fe050aba3b30d578da6bbdb8836a5d281a62151')
b2sums_aarch64=('ef521aa31ebfa5b60db6a1c0c133160f1e40073dac334f09cc8b289619705d543c8ea4151dda6eb4d9120d683fe050aba3b30d578da6bbdb8836a5d281a62151')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
