# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.12.13
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
depends=("gflags")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('204cf37d096dc62c11f17e4eacf27dcc0db430e7720292eced13efaa049b553442d126ef6afc685fe71dbe04f5131efd927ee68c1f4a3e0c40a0607e48f3dcd3')
b2sums_aarch64=('e02635284a00717cec8afe0f17ffd09122dfff638865561025f7ee7cb8cf0153887e2a337de5835f133bab99ceeb6e24a585ff86e9711ca194850ff865789060')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
