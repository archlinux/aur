# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-starburst"
pkgver=4.1.0
pkgrel=1
pkgdesc="Starburst driver for Metabase"
arch=("any")
url="https://github.com/starburstdata/metabase-driver"
license=("Apache-2.0")
depends=("metabase")
source=("starburst.metabase-driver.jar::$url/releases/download/$pkgver/starburst-$pkgver.metabase-driver.jar")
b2sums=('2fab8026714cab5c773debd065bf6404c503379e66cbbbe2d3a6482f8e408ce2ae80b8945dd19b341cf666a30d267825528208df7cc5ac12a1c4ca42ce60f5bf')
noextract=("starburst.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "starburst.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
