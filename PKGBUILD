# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pge'
pkgver=0.1.0
pkgrel=2
pkgdesc='A simple game engine built on top of SDL2'
arch=('x86_64')
makedepends=('pul' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('bb4e4ad4378d05981916dc120b510a04a0659013edf4991fbf71497969eec562')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

