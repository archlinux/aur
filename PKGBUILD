# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: Naxels <naxels at gmail dot com>

pkgname="metabase-driver-duckdb"
pkgver=1.4.3.0
pkgrel=1
pkgdesc="DuckDB driver for Metabase"
arch=("any")
url="https://github.com/motherduckdb/metabase_duckdb_driver"
license=("Apache-2.0")
depends=("metabase")
source=("$url/releases/download/$pkgver/duckdb.metabase-driver.jar")
b2sums=('786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce')
noextract=("duckdb.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "duckdb.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
