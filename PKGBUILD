# Maintainer: robertfoster

pkgname=hoteldruid
pkgver=2.3.2
pkgrel=1
pkgdesc="A php software to manage hotel reservations and booking"
arch=('i686' 'x86_64')
url="http://www.hoteldruid.com/it/index.html"
license=('GPL')
depends=('php' 'mysql')
optdepends=('apache: Web server to run wordpress' 'cherokee: Lightweight Web server to run wordpress')
install=${pkgname}.install
conflicts=('php-residence')
source=(http://www.digitaldruid.net/download/${pkgname}_${pkgver}.tar.gz)

package() {
	install -d $pkgdir/usr/share/webapps/$pkgname
	cp -r $srcdir/$pkgname/* ${pkgdir}/usr/share/webapps/$pkgname
}

md5sums=('6945cf052fe7fdf94c70a6daa3599678')
