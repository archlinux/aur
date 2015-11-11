# Maintainer: Ross Harrison <rtharrison86@gmail.com>

pkgname=gameplay3d
pkgver=0.1
pkgrel=1
pkgdesc="Open-source, cross-platform, C++ game framework/engine for creating 2D/3D mobile and desktop games."
arch=('any')
url="https://github.com/gameplay3d/GamePlay"
license=('Apache 2.0')
depends=('gcc' 'cmake' 'unzip')

source=("$pkgname"::'git+https://github.com/gameplay3d/GamePlay.git')
sha512sums=('SKIP')

build() {
	cd $pkgname

  # install dependencies
  ./install.sh

  # build
  mkdir builld
  cd build
  cmake ..
  make
}

package(){
  sudo mv $pkgname /usr/share/

}
