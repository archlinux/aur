# Maintainer: Pedro P. <pvṕscŕipt [at] gmàil -rmthis- [døt] c0m>
pkgname=lspac
pkgver=1.2.0
pkgrel=1
epoch=0
pkgdesc="Display package informations in a parse friendly fashion"
arch=('any')
url="https://github.com/pvpscript/lspac"
license=('GPL3')
depends=('pacman')
source=("https://github.com/pvpscript/lspac/raw/main/versions/$pkgname-$pkgver.tar.gz")
md5sums=('2f668620659d76118a54f0e3062716cf')
sha256sums=('b9510ea907152899efa1d3103fab7d3f8fbe6be588beb09910df5bd24e0cfa91')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
