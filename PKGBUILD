# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bournal
pkgver=1.5
pkgrel=2
pkgdesc="bash script that allows you to write, search and edit encrypted journal entrie"
arch=('i686' 'x86_64')
url="http://becauseinter.net/bournal/"
depends=('gnupg' 'bash')
license=('gpl')
source=("https://dl.dropboxusercontent.com/u/29095940/oss/${pkgname}-${pkgver}.tar.gz")
md5sums=('691daf0b416a57a5043e9c55b6e2c795')

package() {
cd $srcdir/$pkgname-$pkgver
install -Dm755 bournal $pkgdir/usr/bin/bournal
install -Dm755 bournal-convert $pkgdir/usr/bin/bournal-convert
install -Dm644 bournal.1.gz $pkgdir/usr/share/man/man1/bournal.1.gz
install -Dm644 bournal.desktop $pkgdir/usr/share/applications/bournal.desktop
}
