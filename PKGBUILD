# Author: Dominik Heidler <dominik@heidler.eu>
# Maintainer: Lucas Magalhães <whoisroot@national.shitposting.agency>

pkgname=wg-info
pkgver=60ceb5c
pkgrel=1
pkgdesc="A better wireguard status script"
arch=('any')
url="https://github.com/asdil12/wg-info"
license=('AGPL')
depends=('python')
provides=('wg-info')
source=("git+https://github.com/asdil12/wg-info.git")
sha256sums=(SKIP)

pkgver() {
	git -C wg-info rev-parse --short HEAD
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/local/bin" wg-info
}
