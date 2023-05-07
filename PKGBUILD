# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=VERSION_STRING
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('$(sha256sum v1.6.tar.gz | cut -d " " -f 1)')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/local/bin" install
}
