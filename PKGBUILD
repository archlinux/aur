# Maintainer : elzadam11@tutamail.com

pkgname=fontviwer3000
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple font viewer using SDL2 and SDL2_ttf"
arch=('x86_64')
license=('ZLIB')
depends=('sdl2' 'sdl2_ttf')
makedepends=('gcc' 'make')
source=("main.c" "Makefile" "LICENSE")
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  make
}

package() {
  install -Dm755 fontViwer3000 "$pkgdir/usr/bin/fontViwer3000"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

validpgpkeys=(
	61935d4c56db8559c95c175fab25dde26d490c2d
	)
