# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: Naxels <naxels at gmail dot com>

pkgname="metabase-driver-duckdb"
pkgver=1.4.1.1
pkgrel=1
pkgdesc="DuckDB driver for Metabase"
arch=("any")
url="https://github.com/motherduckdb/metabase_duckdb_driver"
license=("Apache-2.0")
depends=("metabase")
source=("$url/releases/download/$pkgver/duckdb.metabase-driver.jar")
b2sums=('332c6f3f109b88d63c4612d43796d7f1846639769517fcc17e99b7d0ee993b7e517fb5304545f0aae99105d05006639247f4ec9a60209603badb400a1f0111f0')
noextract=("duckdb.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "duckdb.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
