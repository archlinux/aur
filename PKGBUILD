# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>

pkgname=cls
pkgver=1.0
pkgrel=1
pkgdesc="Clear the terminal screen"
arch=('any')
url="https://gist.github.com/ASHWIN990/0c7223cd5b6ffcd657ff9ae008612dde"
license=('GPL3')
makedepends=('gcc')
provides=('cls')
source=("https://gist.githubusercontent.com/ASHWIN990/0c7223cd5b6ffcd657ff9ae008612dde/raw/181aa0291617188416b2cce50553076734568bc0/cls.c")

md5sums=('53b1c8dfbd4d6cbf40930a18f8628259')
sha256sums=('b7bc9e7046d6420870ac5cbb05771f04d806f068b1e4a96e56c2b9762fa78a78')

build() {
	gcc cls.c -o cls
}

package() {
	install -Dm775 cls -t ${pkgdir}/usr/bin/
}
