# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.11.5
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64") # "aarch64")
source_x86_64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
#source_aarch64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('1af783a4c949844e3dbbc6408f4816168464ddc8336e4693de8045040b4174f4e73ce222f6514f660ee412f0b3e6e83cc47b2775884b5894824089c88bd8f95f')
#b2sums_aarch64=('SKIP')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
