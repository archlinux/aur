
# Maintainer: nihilowy <nihilowy at gmail dot com>
pkgname=surfer
pkgver=1
pkgrel=1

pkgdesc="basic webkit2gtk browser"
arch=('i686' 'x86_64')
url="https://github.com/nihilowy/surfer"
license=('GPL')

depends=('webkit2gtk')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nihilowy/$pkgname/archive/master.tar.gz")




build() {
	cd "$pkgname-master"
	make
}



package() {
	cd "$pkgname-master"
	make DESTDIR="$pkgdir/" install
}
md5sums=('2b15b8f2e2743c3c8bd08f585dd1ed78')
