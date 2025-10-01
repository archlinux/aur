# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-duckdb"
pkgver=0.4.1
pkgrel=1
pkgdesc="DuckDB driver for Metabase"
arch=("any")
url="https://github.com/motherduckdb/metabase_duckdb_driver"
license=("Apache-2.0")
depends=("metabase")
source=("$url/releases/download/$pkgver/duckdb.metabase-driver.jar")
b2sums=('bbf3eb3a6c4b9158c2285118bf6ef82df986821c81d9c4c2c15ee34890fee58be0997e41b0f3e0107685bdd67222f26f29a494dc99377e1354c982c6fe61014b')
noextract=("duckdb.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "duckdb.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
