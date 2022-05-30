# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.5
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('5383c0785ff6939554d009fc718d42b97f56c883')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/local/bin" install
}
