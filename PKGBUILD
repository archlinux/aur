
# Maintainer: nihilowy <nihilowy at gmail dot com>
pkgname=surfer
pkgver=1
pkgrel=1

pkgdesc="basic webkit2gtk browser"
arch=('i686' 'x86_64')
url="https://github.com/nihilowy/surfer"
license=('GPL')
makedepends=('git')
depends=('webkit2gtk')

source=("git+https://github.com/nihilowy/surfer.git")




build() {
	cd "$pkgname"
	make
}



package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
