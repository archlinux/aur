# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.13.4
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('19c07ce8fb43aa6233121c3558bcfaba6d8a2f9346e1f792fd3f06997bb254a3b6d65f29f5f7f97987cebc73095e233a4928baa302ea74ec9110531c6acffdcb')
b2sums_aarch64=('df734d12937e141bfab56832e916a7d1b5fc8a2064a74619ce3313a0f279caf479fb36cb1eb2f66aeffcc26cd1ffa16d4f5ffe3fb006f5696f6df74e8aca1cfc')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
