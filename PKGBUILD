# Maintainer: Brandon Barker <bbarker.py@protonmail.ch>
pkgname=mplcolors
pkgver=1.0.0
pkgrel=2
pkgdesc="CLI to display matplotlib colors, colorbars, and other useful functions."
arch=('x86_64')
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
