# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-starburst"
pkgver=6.0.0
pkgrel=1
pkgdesc="Starburst driver for Metabase"
arch=("any")
url="https://github.com/starburstdata/metabase-driver"
license=("Apache-2.0")
depends=("metabase")
source=("starburst.metabase-driver.jar::$url/releases/download/$pkgver/starburst-$pkgver.metabase-driver.jar")
b2sums=('31b178f72dc31bc8f669d9a460fd9b45c1c720f8269a53e37d5f5914f30819659117004eacbc6e789ee3e2832cee4447718d2f458c649f43e02b6810e91d269f')
noextract=("starburst.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "starburst.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
