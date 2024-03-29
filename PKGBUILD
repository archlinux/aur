# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=lightwrite
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightwrite is a simple sdl2 based text-editor."
arch=('x86_64')
url="https://github.com/tim-tm/lightwrite"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver::https://github.com/tim-tm/lightwrite/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
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
