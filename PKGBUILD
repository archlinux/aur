# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=aptman-git
pkgver=r6.2ec5a43
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=()
makedepends=('go')
source=('git+https://gitlab.com/moussaelianarsen/aptman.git')
md5sums=('SKIP')

build() {
	cd aptman
	make
}


package() {
	cd aptman
	make DESTDIR="$pkgdir/" install
}
