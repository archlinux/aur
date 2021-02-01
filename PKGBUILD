# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=achannarasappa-ticker
pkgver=2.0.3
pkgrel=1
pkgdesc='terminal stock watcher and stock position tracker'
arch=('x86_64')
url='https://github.com/achannarasappa/ticker'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/achannarasappa/ticker/releases/download/v$pkgver/ticker-$pkgver-linux-amd64.tar.gz")
sha512sums=('6ca7fdc507072ad5dbe93dda7eadab5f57a834b01bd210dfbcaf24ad55ea6ba9ce161f74612436ad1590e3358840ae8dd0a64665eed28dc2fc568d06cdb63666')

package() {
	install -Dm755 ticker "${pkgdir}"/usr/bin/ticker
}
