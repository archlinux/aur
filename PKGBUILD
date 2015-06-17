# Maintainer: M0Rf30

pkgname=hoteldruid
pkgver=2.1.1
pkgrel=1
pkgdesc="A php software to manage hotel reservations and booking"
arch=('i686' 'x86_64')
url="http://www.digitaldruid.net/php-residence/"
license=('GPL')
depends=('php' 'mysql')
optdepends=('apache: Web server to run wordpress' 'cherokee: Lightweight Web server to run wordpress')
install=${pkgname}.install
conflicts=('php-residence')
source=(http://www.digitaldruid.net/download/${pkgname}_${pkgver}.tar.gz)

package() {
	install -d $pkgdir/srv/http/$pkgname
        cp -r $srcdir/$pkgname/* ${pkgdir}/srv/http/$pkgname
}

md5sums=('aec2542864f938647db29bc6ee25d02f')
