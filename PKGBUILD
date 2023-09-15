# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-clickhouse"
pkgver=1.2.1
pkgrel=1
pkgdesc="ClickHouse driver for Metabase"
arch=("any")
url="https://github.com/ClickHouse/metabase-clickhouse-driver"
license=("APACHE2")
depends=("metabase>=0.47.1")
source=("$url/releases/download/$pkgver/clickhouse.metabase-driver.jar")
sha256sums=('fbc2622d3ab25417436c8753f467955b90fc5e5c2420a4d1a2b29aab4259c683')
noextract=("clickhouse.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "clickhouse.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
