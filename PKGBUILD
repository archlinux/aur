# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.1.0
pkgrel=1
pkgdesc="Monitor a process and trigger a notification."
arch=('x86_64')
url="https://github.com/variadico/noti"
license=('MIT')
source=("https://github.com/variadico/noti/releases/download/$pkgver/noti$pkgver.linux-amd64.tar.gz"
		'https://raw.githubusercontent.com/variadico/noti/master/LICENSE')
sha256sums=('959410e065ed36554c8c2e2b94c803de5dc8c149b2e88c220b814cb31b23f684'
			'b4a3a12c17bfa1aa933c19c82c661e874638647b057ceaaafb0c6dc63111dfd2')

package() {
	install -Dm755 noti "$pkgdir/usr/bin/noti"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
