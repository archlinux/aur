# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-dremio"
pkgver=1.2.0
pkgrel=1
pkgdesc="Dremio driver for Metabase"
arch=("any")
url="https://github.com/Baoqi/metabase-dremio-driver"
license=("EPL2")
depends=("metabase")
source=("$url/releases/download/$pkgver/dremio.metabase-driver.jar")
sha256sums=('6cf303c7387e15412354831f6e2fae4f898ddfb1f9fb9168b5e54b2f713d4978')
noextract=("dremio.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "dremio.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
