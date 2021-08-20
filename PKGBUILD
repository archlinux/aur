# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.1
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('871c17129c1ea80f4e3313ae8bff29f8bd4205e3308e6376340a967a9a83e498')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/bin" install
}
