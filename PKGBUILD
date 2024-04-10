# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=ped
pkgver=0.0.3
pkgrel=3
pkgdesc="Ped is a vim-like editor built with ncurses."
arch=('x86_64')
url="https://github.com/tim-tm/ped"
license=('MIT')
depends=('glibc' 'ncurses')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver::https://github.com/tim-tm/ped/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
    ./configure
    make
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}
