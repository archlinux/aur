# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='libpaca'
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple game engine library built on top of SDL2'
arch=('x86_64')
makedepends=('libpocha' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8c27dcaeee0df6912dfa5230b973cec56f8b70e6ba0cc3732ba3ee1a3233608a')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

