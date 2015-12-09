# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-advanced-windowlist
_name=adv_windowlist.pl
pkgver=1.0a6
pkgrel=1
pkgdesc="Adds a permanent advanced window list to irssi status bar"
arch=(any)
url="http://anti.teamidiot.de/static/nei/*/Code/Irssi/"
source=("http://anti.teamidiot.de/static/nei/*/Code/Irssi/$_name")
license=('GPL')
depends=('irssi')
md5sums=('2ac4c6d8498fd9284d3575f4bfe92910')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
