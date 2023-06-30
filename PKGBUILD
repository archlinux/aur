# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-clickhouse"
pkgver=1.1.7
pkgrel=1
pkgdesc="ClickHouse driver for Metabase"
arch=("any")
url="https://github.com/ClickHouse/metabase-clickhouse-driver"
license=("APACHE2")
depends=("metabase")
source=("$url/releases/download/$pkgver/clickhouse.metabase-driver.jar")
sha256sums=('43d23c91efef447084a1f22e053d26be5524b72eac2ec76eef7bd3c0799f848e')
noextract=("clickhouse.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "clickhouse.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
