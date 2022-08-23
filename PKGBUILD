# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.5.1
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3dedcb0a4360f777c8ad271f1f463c35aa0b7c884bb679cebb6b309f0f176bd0')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/local/bin" install
}
