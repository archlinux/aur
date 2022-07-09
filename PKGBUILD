# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='libpaca'
pkgver=0.5.0
pkgrel=1
pkgdesc='Simple game engine library built on top of SDL2'
arch=('x86_64')
makedepends=('libpocha' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('abffc2ae4e7f4aca64070afa17840b348bd03bc803e5338a1ded6c9eaec9d04c')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

