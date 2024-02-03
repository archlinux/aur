# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-clickhouse"
pkgver=1.3.3
pkgrel=1
pkgdesc="ClickHouse driver for Metabase"
arch=("any")
url="https://github.com/ClickHouse/metabase-clickhouse-driver"
license=("APACHE2")
depends=("metabase>=0.47.1")
source=("$url/releases/download/$pkgver/clickhouse.metabase-driver.jar")
b2sums=('9b20d572934e20ee1f6dd1e807fd7f30ad8b598dbfa3d57d1534bad5ba2a876b4739ae23f5ea167e678c4b17fd8ec67fd08cc6c2a64dd5a1107233f68dc03115')
noextract=("clickhouse.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "clickhouse.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
