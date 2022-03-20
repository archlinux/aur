# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=yacreader-9.0
pkgver=9.0.0
pkgrel=2
pkgdesc="Stable legacy version of YACReader"
arch=(any)
url="https://github.com/YACReader/yacreader/tree/5bf5297229827a77b495e9b7ecd94fe7c25b61f0"
license=(GPL3)
depends=(libunarr poppler-qt5 glu qt5-base qt5-multimedia qt5-script qt5-quickcontrols qt5-graphicaleffects)
makedepends=(make)
optdepends=()
provides=(YACReader YACReaderLibrary)
source=("git+https://github.com/YACReader/yacreader.git")
md5sums=("SKIP")

package() {
  cd "$srcdir/yacreader"
  git checkout "5bf5297229827a77b495e9b7ecd94fe7c25b61f0"

  qmake-qt5
  make
  make install
}
