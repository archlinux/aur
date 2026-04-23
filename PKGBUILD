# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.21.3
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"

url="https://gizmodata.com/gizmosql"
arch=("x86_64" "aarch64")
license=("Apache-2.0")

depends=("gflags")

options=("!strip")

source_x86_64=("gizmosql-${pkgver}-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-${pkgver}-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('a868eb756c5ed96637c22ff68017fbb03e384a7e83658df02dc9b32f1a80df54e013a763f764f4f4824f35020b8bb87af27e1eae66828520b71d3f5d843941ae')
b2sums_aarch64=('dd06b3b66d93e8809bab7ab5b3ee3a1d813d373f7046c97ba025ffa4df0f604261ec7bfab9b22dfc019f8e2ebf0d704c8b13b6ac0e4a639685af3725390f3eef')

package(){
    install -D -m 755 "gizmosql_server" -t "${pkgdir}/usr/bin"
    install -D -m 755 "gizmosql_client" -t "${pkgdir}/usr/bin"
}
