# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.2
pkgrel=1
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f96718e3b53b479a381420e353ba118ffdf5c73805e8e56f9f30dcf42ca06f64')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/bin" install
}
