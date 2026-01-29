# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.16.0
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"

url="https://gizmodata.com/gizmosql"
arch=("x86_64" "aarch64")
license=("Apache-2.0")

depends=("gflags")

options=("!strip")

source_x86_64=("gizmosql-${pkgver}-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-${pkgver}-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('da194fe3baa44d11a5386e66dbf148141bf28dc72f153216a25c0f0d4eae1ff7130d24c7bd4fb10395c40e38baa49026e7d6c0a5e788079e67c79757680ad6fc')
b2sums_aarch64=('93063145018c0aeb284250f56e7a2816e1b183e5a5355f6cc74343aa07a893a1a51da41cc895133ba4f82f45a6fd7e8f9ee0d525532b82c5b830d9dfc0ff204a')

package(){
    install -D -m 755 "gizmosql_server" -t "${pkgdir}/usr/bin"
    install -D -m 755 "gizmosql_client" -t "${pkgdir}/usr/bin"
}
