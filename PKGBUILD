# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="gizmosql-bin"
pkgver=1.18.1
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"

url="https://gizmodata.com/gizmosql"
arch=("x86_64" "aarch64")
license=("Apache-2.0")

depends=("gflags")

options=("!strip")

source_x86_64=("gizmosql-${pkgver}-amd64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-${pkgver}-arm64.zip::https://github.com/gizmodata/gizmosql/releases/download/v${pkgver}/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('64f40a229db9e11740b01e3308d5d3bda279d3636a94108ea81be0e51b69b69596ec405dcdb6a44184f7138cd79a1b2182b198ceebeb80224ea51bf4b53ca9a6')
b2sums_aarch64=('cd7fa26989f7a18112f95f66eafc18b08013c9618c1a7bcb89b3e36b4c62d8d5e63cb98885dfb7c099ed867756447f9b9b80708c485ee907ef3e8708e73aeb09')

package(){
    install -D -m 755 "gizmosql_server" -t "${pkgdir}/usr/bin"
    install -D -m 755 "gizmosql_client" -t "${pkgdir}/usr/bin"
}
