# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=deco
pkgver=1.6.4
pkgrel=1
pkgdesc="A command-line utility to extract various archive file formats"
arch=('i686' 'x86_64')
url="https://github.com/peha/deco"
license=('GPL3')
optdepends=('deco-archive: extractor wrappers for various formats')
source=($pkgname-$pkgver.tar.gz::https://github.com/peha/deco/archive/$pkgver.tar.gz)
sha256sums=('6139b3efbe9df995ea0bb4506ba2edc00398d0dff6ba2728a1148366208cfdb7')

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr CC=gcc CFLAGS="${CFLAGS}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
