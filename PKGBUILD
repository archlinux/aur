# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-clickhouse"
pkgver=1.53.4
pkgrel=1
pkgdesc="ClickHouse driver for Metabase"
arch=("any")
url="https://github.com/ClickHouse/metabase-clickhouse-driver"
license=("APACHE2")
depends=("metabase>=0.47.1")
source=("$url/releases/download/$pkgver/clickhouse.metabase-driver.jar")
b2sums=('f9c78eb7bfe5429ed0e5c2e5aac922febb5f2adf05b277e1adc0352a05475e5840230a62063e059145cc8d80f770b6aa7c6f889c1aca973df9ce43e0445dfeda')
noextract=("clickhouse.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "clickhouse.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
