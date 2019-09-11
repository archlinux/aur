# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.3.0
pkgrel=1
pkgdesc="Monitor a process and trigger a notification."
arch=('x86_64')
url="https://github.com/variadico/noti"
license=('MIT')
source=("https://github.com/variadico/noti/releases/download/$pkgver/noti$pkgver.linux-amd64.tar.gz"
		'https://raw.githubusercontent.com/variadico/noti/master/LICENSE')
sha256sums=('503181777a2bddf625dbbe13845bf21a8d549f51531f1114140e9d4a9ab7f2a7'
            'b4a3a12c17bfa1aa933c19c82c661e874638647b057ceaaafb0c6dc63111dfd2')

package() {
	install -Dm755 noti "$pkgdir/usr/bin/noti"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
