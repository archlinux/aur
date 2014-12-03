# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=deco-archive
pkgver=1.6
pkgrel=1
pkgdesc="A collection of extractor wrappers for the deco file extraction framework"
arch=('any')
url="http://hartlich.com/deco/archive/"
license=('GPL3')
depends=('deco')
source=(http://hartlich.com/deco/archive/download/$pkgname-$pkgver.tar.gz)
sha256sums=('128253a1b232ac10993d7a20b6cb31dfc1f4ad9d9015b0483a33fb6ea558844d')

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
