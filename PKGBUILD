# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.30.0
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"

url="https://gizmodata.com/gizmosql"
arch=("x86_64" "aarch64")
license=("Apache-2.0")

depends=("gflags")

options=("!strip")

source_x86_64=("gizmosql-${pkgver}-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-${pkgver}-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('2ef29771e12fce9a2ea9795725ec0424400848dfc988b914b15cd34e5539edc5d5bed889a57bfa3cfe270267e54a5fb4b026dbae86293de8a5cf653f89c36433')
b2sums_aarch64=('cef8d91f7d65155477b824cbc439e2c7f2800d4308e592bc99137f1e0d5e5905cc92f2110e3a4efc5d2d5aa29b1757b2c0777bc9edceb560d9eafab30176cb05')

package(){
    install -D -m 755 "gizmosql_server" -t "${pkgdir}/usr/bin"
    install -D -m 755 "gizmosql_client" -t "${pkgdir}/usr/bin"
}
