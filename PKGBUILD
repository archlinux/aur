# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=pop-wallpapers-git
pkgver=c7a37b4
pkgrel=1
pkgdesc='Official Pop!_OS Wallpapers'
arch=('any')
url='https://github.com/pop-os/wallpapers'
license=('cc-by-sa' 'public domain')
depends=()
makedepends=('imagemagick')
source=("git+https://github.com/pop-os/wallpapers.git")
md5sums=('SKIP')

build() {
  cd "wallpapers"
  make -j
}

package() {
  cd "wallpapers"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
