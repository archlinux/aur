# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-advanced-windowlist
_name=adv_windowlist.pl
pkgver=1.2
pkgrel=1
pkgdesc="Adds a permanent advanced window list to irssi status bar"
arch=(any)
url="http://anti.teamidiot.de/static/nei/*/Code/Irssi/"
source=("http://anti.teamidiot.de/static/nei/*/Code/Irssi/$_name")
license=('GPL')
depends=('irssi')
md5sums=('ed86151658a6017c1e32bdec88eb5882')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
