# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-teradata"
_pkgvermetabase=0.46.6
_pkgverjdbc=17.10
pkgver=1.1.6
pkgrel=1
pkgdesc="Teradata driver for Metabase"
arch=("any")
url="https://github.com/swisscom-bigdata/metabase-teradata-driver"
license=("EPL")
depends=("metabase")
source=("$url/releases/download/$pkgver-metabase-v$_pkgvermetabase-teradata-jdbc-$_pkgverjdbc/teradata.metabase-driver.jar")
sha256sums=('495ec87b6a4ecca1225ed087aa27a9a6219178cf5ec278c10ede61627d025fbc')
noextract=("teradata.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "teradata.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
