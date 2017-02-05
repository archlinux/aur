
# Maintainer: nihilowy <nihilowy at gmail dot com>
pkgname=surfer
pkgver=1
pkgrel=1

pkgdesc="basic webkit2gtk browser"
arch=('i686' 'x86_64')
url="https://github.com/nihilowy/surfer"
license=('GPL')

depends=('webkit2gtk')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nihilowy/surfer.git")




build() {
	cd "$pkgname-$pkgver"
	make
}



package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('21639801431746e77ced2641bad3bbe1')
