# Maintainer: Pedro P. <pvṕscŕipt [at] gmàil -rmthis- [døt] c0m>
pkgname=lspac
pkgver=1.1.0
pkgrel=1
epoch=0
pkgdesc="Display package informations in a parse friendly fashion"
arch=('x86_64')
url="https://github.com/pvpscript/lspac"
license=('GPL3')
depends=('pacman')
source=("https://github.com/pvpscript/lspac/raw/main/versions/$pkgname-$pkgver.tar.gz")
md5sums=('da0863eef80f2d5187ac5cc82b300839')
sha256sums=('06dd14a7378b53159b4b83ffd7b1c1e2411768ec7137b551b5939b1c4e485a9c')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
