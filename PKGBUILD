# Maintainer: Brandon Barker <bbarker.py@protonmail.ch>
pkgname=mplcolors
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI to display matplotlib colors, colorbars, and other useful functions."
arch=('any')
url="https://github.com/AstroBarker/mplcolors"
depends=("bash" "python")
makedepends=("git")
optdepends=()
provides=()
conflicts=()
license=("GPL")
source=("$pkgname::git+https://github.com/astrobarker/mplcolors.git")
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
sha256sums=('SKIP')
