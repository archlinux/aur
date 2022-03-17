# Maintainer: Matthew Rease <scubaventure101[AT]hotmail[DOT]com>
pkgname=mash-sh
pkgver=0.0
pkgrel=1
pkgdesc="A bash/zsh like shell, written in C."
arch=('x86_64' 'aarch64' 'ppc')
url="https://gitlab.com/Magicrafter13/mash"
license=('GPL3')
changelog=
source=("$pkgname"::"git+https://gitlab.com/Magicrafter13/mash.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  make -j
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/usr/bin" install
}
