#Maintainer: Archydan <daniel at dragusanu dot net>
pkgname=aspell5-ro
pkgver=3.3.10
pkgrel=1
pkgdesc="Romanian dictionary for Aspell"
arch=('any')
url="https://rospell.wordpress.com"
license=('GPL2')
depends=('aspell>=0.50')
source=("http://downloads.sourceforge.net/rospell/$pkgname-$pkgver.tar.bz2")
md5sums=('d74c9bf5254877758ade91990132a1d5')

build() {
	cd "$pkgname-$pkgver"
	./configure --vars DESTDIR="/usr"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

