# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-teradata"
_pkgvermetabase=0.61.1
_pkgverjdbc=20.00
pkgver=1.1.19
pkgrel=1
pkgdesc="Teradata driver for Metabase"
arch=("any")
url="https://github.com/swisscom-bigdata/metabase-teradata-driver"
license=("EPL")
depends=("metabase")
source=("$url/releases/download/$pkgver-metabase-v$_pkgvermetabase-teradata-jdbc-$_pkgverjdbc/teradata.metabase-driver.jar")
sha256sums=('97ebb52b4b155a2444fbdbfa1d282929410096d881df603f6b2b0314caf7d812')
noextract=("teradata.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "teradata.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
