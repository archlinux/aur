# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-advanced-windowlist
_name=adv_windowlist.pl
pkgver=1.0a2
pkgrel=1
pkgdesc="Adds a permanent advanced window list to irssi status bar"
arch=(any)
url="http://anti.teamidiot.de/static/nei/*/Code/Irssi/"
source=("http://anti.teamidiot.de/static/nei/*/Code/Irssi/$_name")
license=('GPL')
depends=('irssi')
md5sums=('15f1a15ef9d904d5f765a768470a9f4a')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
