# Maintainer: Dawid Majewski <mdawid581@gmail.com>

pkgname=libigloo
pkgver=0.9.5
pkgrel=1
pkgdesc='Common C framework by the Icecast project'
arch=(x86_64)
url='ftp.osuosl.org/pub/xiph/releases/igloo'
license=("GNU-GPL")
source=("$pkgname-$pkgver.tar.gz::https://ftp.osuosl.org/pub/xiph/releases/igloo/$pkgname-$pkgver.tar.gz")
sha256sums=('ea22e9119f7a2188810f99100c5155c6762d4595ae213b9ac29e69b4f0b87289')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
	sudo make install
}

package() {
	echo hi, this is my first aur package, enjoy!
}