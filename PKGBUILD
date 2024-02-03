# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-duckdb"
pkgver=0.2.3
pkgrel=1
pkgdesc="DuckDB driver for Metabase"
arch=("any")
url="https://github.com/AlexR2D2/metabase_duckdb_driver"
license=("APACHE2")
depends=("metabase")
source=("$url/releases/download/$pkgver/duckdb.metabase-driver.jar")
b2sums=('6fc97953871918b518fef998c3a7d8e5a9875627007346aea6853c86a2821a685550273a2e88e86cbd0165537745ff4f0ae4706cf98e977f56b8bba3f253822e')
noextract=("duckdb.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "duckdb.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
