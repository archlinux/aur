# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pge'
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple game engine built on top of SDL2'
arch=('x86_64')
makedepends=('pul' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

