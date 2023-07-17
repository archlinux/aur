# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: crab <crabtw@gmail.com>

pkgname=gem2arch
pkgver=0.11
pkgrel=2
pkgdesc='Create PKGBUILD from Ruby Gem Package'
arch=(any)
license=(GPL3)
url='https://github.com/anatol/gem2arch'
depends=(ruby ruby-erubis)
optdepends=(
  'git: for --git support'
)
source=(gem2arch-$pkgver.zip::https://github.com/anatol/gem2arch/archive/$pkgver.zip)
sha1sums=('9fe76219255f251f85df7080ceece0dfe766b885')

package() {
  cd $pkgname-$pkgver
  install -D -m755 gem2arch.rb "$pkgdir/usr/bin/gem2arch"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
