# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.4.0
pkgrel=1
pkgdesc="Monitor a process and trigger a notification."
arch=('x86_64')
url="https://github.com/variadico/noti"
license=('MIT')
source=("https://github.com/variadico/noti/releases/download/$pkgver/noti$pkgver.linux-amd64.tar.gz"
		'https://raw.githubusercontent.com/variadico/noti/master/LICENSE')
sha256sums=('0547c354f0a7a683fa1993983734e45f0f12911438cd8eb4f4da42b5d29d90a9'
            'b4a3a12c17bfa1aa933c19c82c661e874638647b057ceaaafb0c6dc63111dfd2')

package() {
	install -Dm755 noti "$pkgdir/usr/bin/noti"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
