# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=deco
pkgver=1.6.3
pkgrel=1
pkgdesc="A command-line utility to extract various archive file formats"
arch=('i686' 'x86_64')
url="http://hartlich.com/deco/"
license=('GPL3')
optdepends=('deco-archive: extractor wrappers for various formats')
source=(http://hartlich.com/deco/download/$pkgname-$pkgver.tar.gz)
sha256sums=('8385aca7c109437c7c3e1986448ff3b0728d1f6be09d09a8d735f32ab8e3d668')

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr CC=gcc CFLAGS="${CFLAGS}"
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
sha256sums=('18caa51d3a967076a93d4f287f70071cc40c06eb68cc7f663e9ce3269ddad6f5')
