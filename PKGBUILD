# Maintainer: Tobias Kamm <tobias.kamm@tutanota.de>
pkgname=memeassembly
pkgver=1.5
pkgrel=2
pkgdesc="A Meme-based programming language"
arch=('x86_64')
url="https://kammt.github.io/MemeAssembly/#/"
license=('GPL3')
depends=('gcc')
source=(https://github.com/kammt/MemeAssembly/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('cefb380f433712fdb153725e7d21045ff3d4e06f0c30357bf0d01a456ce498ef')

package() {
  cd "MemeAssembly-$pkgver"

  make DESTDIR="$pkgdir/usr/local/bin" install
}
