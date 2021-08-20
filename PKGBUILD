# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.1.1
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6ce1a4db95092028c6621e7da93999e236fb760b35ba4c478ec32ddcf834b5cd')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/bin" install
}
