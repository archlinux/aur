# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="gizmosql-bin"
pkgver=1.9.11
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
source_x86_64=("https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('acc7070e969906e10f244367079221df250d2e7ef543a1e96acff2c07fabf49010edbc0ee6715c0ada975020524f41d91c52693dcdaf7048d8d0105c47ef8b97')
b2sums_aarch64=('dc486e220696ec97ce8d2d62898a25d21884d11bb945700d70b9a13cc722c6defcd1277f97bb88e37b77ab0e66468443b3eefec53da140d513fa02b116c4d95e')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
