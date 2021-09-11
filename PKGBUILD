# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname="smarty3"
pkgver=3.1.39
pkgrel=1
pkgdesc="A PHP template engine"
url="http://www.smarty.net"
license=("LGPL")
depends=("php>=5.2")
arch=("any")
source=("https://github.com/smarty-php/smarty/archive/v$pkgver.tar.gz")
sha256sums=('d89ed84ed9bdf2697df9fb867acb03514ddafc8322e1b31860168adec91e70c2')

package(){
 install -d "$pkgdir/usr/share/php"
 cp -dpr --no-preserve=ownership "$srcdir/smarty-$pkgver/libs" "$pkgdir/usr/share/php/smarty3"
}
