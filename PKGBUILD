
# Maintainer: MatsyaOS <admin@matsyaos.ml>
pkgname=matsya-wallpappers
pkgver=1.1
pkgrel=1
pkgdesc="Wallpapers for Matsya OS"
arch=('any')
url="https://github.com/MatsyaOs/wallpappers"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules')
depends=()
source=('git'+'https://github.com/MatsyaOs/wallpappers')
md5sums=('SKIP')


build() {

	cd "$srcdir"/wallpappers/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd wallpappers
  DESTDIR="$pkgdir" make install
}
