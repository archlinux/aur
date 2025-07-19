# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.9.13
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('9868d9c22032fdd5a4d5239c41dc2a61f6e6e9afd54fa1ca0dca64d2d5e63205db7254072864e5b4dbce0e18c7d8347c602bec4abccdeb1beacaaf74e037a53d')
b2sums_aarch64=('9868d9c22032fdd5a4d5239c41dc2a61f6e6e9afd54fa1ca0dca64d2d5e63205db7254072864e5b4dbce0e18c7d8347c602bec4abccdeb1beacaaf74e037a53d')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
