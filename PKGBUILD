# Maintainer: robertfoster

pkgname=hoteldruid
pkgver=3.0.6
pkgrel=1
pkgdesc="A php software to manage hotel reservations and booking"
arch=('i686' 'x86_64')
url="http://www.hoteldruid.com/it/index.html"
license=('GPL')
depends=('php' 'mysql')
optdepends=(
  'apache: A high performance Unix-based HTTP server'
  'nginx: Lightweight HTTP server and IMAP/POP3 proxy server'
)
install=${pkgname}.install
conflicts=('php-residence')
source=(http://www.digitaldruid.net/download/${pkgname}_${pkgver}.tar.gz)

package() {
  install -d $pkgdir/usr/share/webapps/$pkgname
  cp -r $srcdir/$pkgname/* ${pkgdir}/usr/share/webapps/$pkgname
}

sha256sums=('db2a58a08f3e87f66e0ed9e7f71bb92863ceaeab963e0c77e222c222e1b25d2e')
