# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.11.9
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64") # "aarch64")
source_x86_64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
#source_aarch64=("gizmosql-$pkgver-$CARCH.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('143332b54ca00e89e4e2dc017af2f9be2b2872416dfa6f7130e53c5408df12ba4c55e8d63f22d9e88bf073d387cf88ea2c6191ac421192b6bfd70f79369253d6')
#b2sums_aarch64=('SKIP')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
