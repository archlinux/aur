# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.12.7
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64") # "aarch64")
source_x86_64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
#source_aarch64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('b341c66feab99a49ad108637330e4c7c023e5fa3695d1aebc5bef7da40e6a434fcb482bda9cbe03e5096425ca4e0764dd0ffa9a5958ff84f7e786ae180fb44f1')
#b2sums_aarch64=('SKIP')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
