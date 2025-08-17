# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee <teeaur at duck dot com>

pkgname="gizmosql-bin"
pkgver=1.9.14
pkgrel=1
pkgdesc="A Flight SQL Server implementation with DuckDB and SQLite back-ends"
url="https://gizmodata.com/gizmosql"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
source_x86_64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_amd64.zip")
source_aarch64=("gizmosql-$pkgver-$arch.zip::https://github.com/gizmodata/gizmosql/releases/download/v$pkgver/gizmosql_cli_linux_arm64.zip")
b2sums_x86_64=('5bb4d1e456d27fea7b6f3842a67e335360a8aeee1b8c255e89cdb0d083c446b3058faf25a4d6d4fa75ae31ebff29ac2a1976f4d48ca75d52ea2aa7e315f938bf')
b2sums_aarch64=('5bb4d1e456d27fea7b6f3842a67e335360a8aeee1b8c255e89cdb0d083c446b3058faf25a4d6d4fa75ae31ebff29ac2a1976f4d48ca75d52ea2aa7e315f938bf')
options=("!strip")

package(){
 install -D -m 755 "gizmosql_server" -t "$pkgdir/usr/bin"
 install -D -m 755 "gizmosql_client" -t "$pkgdir/usr/bin"
}
