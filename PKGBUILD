# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.12.8
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64") # "aarch64")
source_x86_64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
#source_aarch64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('1917ff98b0be8c1f7d1718e386c9d8f9251747ade86206d0384c950fd977772f65e28e1a9fa25fb639e42526d3968689303d6392c8f58d542f1081ca6a2a5441')
#b2sums_aarch64=('SKIP')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
