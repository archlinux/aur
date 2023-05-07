# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.6
pkgrel=3
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('0a54e9e7098e5727ad5499805ceaab6ff7c65d20429964731b4aac4e9938ea9b')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir" install
}
