# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.14.1
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('766b61048cf2c0e1493a5b09a78cb06d2a7bde4f0dd2d9ea69a133507c24edd1c6542e2cb2d5dde3c04cf39119789cca4e8ba210b236898bfd579ec28beff785')
b2sums_aarch64=('894755450d405c2be094ef4dac306b45e995f7029d082c58fb1ad5567c73a51a20be0a1ccf3dc343034ee7b7a2e8ff8c9f7d0ad50a885ea43c72da64f3e02936')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
