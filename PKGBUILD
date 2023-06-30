# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-duckdb"
pkgver=0.2.2
pkgrel=1
pkgdesc="DuckDB driver for Metabase"
arch=("any")
url="https://github.com/AlexR2D2/metabase_duckdb_driver"
license=("APACHE2")
depends=("metabase")
source=("$url/releases/download/$pkgver/duckdb.metabase-driver.jar")
sha256sums=('c942d46ea3c888024285d22fdbea069eca51a81012196861b26d68e959abb968')
noextract=("duckdb.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "duckdb.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
