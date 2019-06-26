# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.2.0
pkgrel=1
pkgdesc="Monitor a process and trigger a notification."
arch=('x86_64')
url="https://github.com/variadico/noti"
license=('MIT')
source=("https://github.com/variadico/noti/releases/download/$pkgver/noti$pkgver.linux-amd64.tar.gz"
		'https://raw.githubusercontent.com/variadico/noti/master/LICENSE')
sha256sums=('d86aa61c00d2a527b53d2dc04c886db9aa454c726f12a07244c755120b06749e'
            'b4a3a12c17bfa1aa933c19c82c661e874638647b057ceaaafb0c6dc63111dfd2')

package() {
	install -Dm755 noti "$pkgdir/usr/bin/noti"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
