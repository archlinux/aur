# Maintainer: Pedro P. <pvṕscŕipt [at] gmàil -rmthis- [døt] c0m>
pkgname=lspac
pkgver=1.1.1
pkgrel=1
epoch=0
pkgdesc="Display package informations in a parse friendly fashion"
arch=('any')
url="https://github.com/pvpscript/lspac"
license=('GPL3')
depends=('pacman')
source=("https://github.com/pvpscript/lspac/raw/main/versions/$pkgname-$pkgver.tar.gz")
md5sums=('86988a1a6071aaf240657def8bb34526')
sha256sums=('609edf39298dfe48f0077dece1c3d47dcb3b706fe584a8c5a22d16f214a44a2e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
