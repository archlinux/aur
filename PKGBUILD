# Maintainer: Loek Le Blansch <loek@pipeframe.xyz>

pkgname=qft-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="Quick Peer-To-Peer UDP file transfer"
arch=('x86_64')
url="https://github.com/TudbuT/qft"
license=('GPL3')
source=("https://github.com/TudbuT/qft/releases/download/v$pkgver/qft-nogui")
sha256sums=('29a6433df801c8082cbbd7bdc9f5f41dda98f56919dcd4b4cd9cf14a65deb64f')

package() {
	install -D -m 755 "$srcdir/qft-nogui" "$pkgdir/usr/bin/qft"
}

