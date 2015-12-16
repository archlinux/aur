# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=deco-archive
pkgver=1.7
pkgrel=1
pkgdesc="A collection of extractor wrappers for the deco file extraction framework"
arch=('any')
url="https://github.com/peha/deco-archive"
license=('GPL3')
depends=('deco')
source=($pkgname-$pkgver.tar.gz::https://github.com/peha/deco-archive/archive/$pkgver.tar.gz)
sha256sums=('280a9cf4df8f0a5fe5eb390870c791d3d2cf831b1397a3e4734366f112514ce1')

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
