# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname="smarty3"
pkgver=3.1.48
pkgrel=1
pkgdesc="A PHP template engine"
url="http://www.smarty.net"
license=("LGPL")
depends=("php>=5.2")
arch=("any")
source=("https://github.com/smarty-php/smarty/archive/v$pkgver.tar.gz")
sha256sums=('6a8a7d35b9be33c3a9fcf70df8a3b3652f0388f8015dda259ed04ff49fe38b4c')

package(){
 install -d "$pkgdir/usr/share/php"
 cp -dpr --no-preserve=ownership "$srcdir/smarty-$pkgver/libs" "$pkgdir/usr/share/php/smarty3"
}
