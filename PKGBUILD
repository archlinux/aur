# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.42.3
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"

url="https://gizmodata.com/gizmosql"
arch=("x86_64" "aarch64")
license=("Apache-2.0")

depends=("gflags")

options=("!strip")

source_x86_64=("gizmosql-${pkgver}-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-${pkgver}-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('3b8d2f45b5bb2ed3c1de8ae36195b52c1059bec4caaf68be51a0d1de6337b1a269d94641c897158fa948919ab4128884ad97694eb5a2d3e19cf67899f175150d')
b2sums_aarch64=('e7ad0e6c4f5acdf72114baf8ab01b68a582bfce21262a2a55ea87803e57968dbcd7783e25998d4c1c3edfb564c3fe51c3dfde9ab3c0e8d1a122696a0b3c53ff4')

package(){
    install -D -m 755 "gizmosql_server" -t "${pkgdir}/usr/bin"
    install -D -m 755 "gizmosql_client" -t "${pkgdir}/usr/bin"
}
