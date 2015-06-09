# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-advanced-windowlist
_name=adv_windowlist.pl
pkgver=0.9b7
pkgrel=1
pkgdesc="Adds a permanent advanced window list to irssi status bar"
arch=(any)
url="http://anti.teamidiot.de/static/nei/*/Code/Irssi/"
source=("http://anti.teamidiot.de/static/nei/*/Code/Irssi/$_name")
license=('GPL')
depends=('irssi')
md5sums=('57588498aa1c270c93b68d47fe0fa327')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
