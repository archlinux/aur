# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-dremio"
pkgver=1.5.0
pkgrel=1
pkgdesc="Dremio driver for Metabase"
arch=("any")
url="https://github.com/Baoqi/metabase-dremio-driver"
license=("EPL2")
depends=("metabase")
source=("$url/releases/download/$pkgver/dremio.metabase-driver.jar")
sha256sums=('caf3113cc813d98c64c57fd258277f4fbc736961e11ea865111952217363f1aa')
noextract=("dremio.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "dremio.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
