# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-starburst"
pkgver=6.1.0
pkgrel=1
pkgdesc="Starburst driver for Metabase"
arch=("any")
url="https://github.com/starburstdata/metabase-driver"
license=("Apache-2.0")
depends=("metabase")
source=("starburst.metabase-driver.jar::$url/releases/download/$pkgver/starburst-$pkgver.metabase-driver.jar")
b2sums=('09e180b299c1808d4e23645fb1c454243e5ab6d4e922ecafadadb2faf30c1311cdca5701bcd7c7093c647a655546dd151486a183e9401704f936fd48676f6584')
noextract=("starburst.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "starburst.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
