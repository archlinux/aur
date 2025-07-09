# Maintainer: Saffron <qwertysaffron@tutamail.com>
pkgname=nethole
pkgver=1.0
pkgrel=1
pkgdesc="A wifi tool which uses arpspoof to exploit WPA3 and deauthenticate it regardless of its MFP"
arch=(any)
url="https://github.com/Saffron-sh/nethole"
license=("LicenseRef-MIT")
depends=('dsniff')
source=("https://raw.githubusercontent.com/saffron-sh/nethole/master/nethole.sh")
md5sums=("SKIP")
package() {
	install -Dm755 "$srcdir/nethole.sh" "$pkgdir/usr/bin/nethole"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
