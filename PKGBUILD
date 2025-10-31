# Maintainer: Saffron <qwertysaffron@tutamail.com>
pkgname=nethole
pkgver=2.0
pkgrel=1
pkgdesc="A wifi tool which uses arpspoof to exploit WPA3 and deauthenticate it regardless of its MFP"
arch=(any)
url="https://github.com/Saffron-sh/nethole"
depends=('dsniff')
source=("https://raw.githubusercontent.com/saffron-sh/nethole/master/nethole.sh")
md5sums=("SKIP")
package() {
	install -Dm755 "$srcdir/nethole.sh" "$pkgdir/usr/bin/nethole"	
}
