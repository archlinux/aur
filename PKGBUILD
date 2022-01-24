# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.3
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b2a872e987f67d28845271bc4e37b82484d1253e5f84bca8ff0e8b966f5903c3')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/local/bin" install
}
