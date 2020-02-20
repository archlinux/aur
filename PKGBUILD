# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=aptyay-git
pkgver=r2.42785d0
pkgrel=1
pkgdesc="Changes yay syntax to be more like APT"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=()
makedepends=('go')
source=('git+https://gitlab.com/moussaelianarsen/aptyay.git')
md5sums=('SKIP')

build() {
	cd aptyay
	make
}


package() {
	cd aptyay
	make DESTDIR="$pkgdir/" install
}
