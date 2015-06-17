# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: crab <crabtw@gmail.com>

pkgname=gem2arch
pkgver=0.11
pkgrel=1
pkgdesc='Create PKGBUILD from Ruby Gem Package'
arch=(any)
license=(GPL3)
url='https://github.com/anatol/gem2arch'
depends=(ruby ruby-erubis pkgbuild-introspection)
optdepends=(
  'git: for --git support'
  'burp: for --aur flag support'
)
source=(https://github.com/anatol/gem2arch/archive/$pkgver.zip)
sha1sums=('bd285eb66fb1d835978f708bcb30ecaac7d8f515')

package() {
  cd $pkgname-$pkgver
  install -D -m755 gem2arch.rb "$pkgdir/usr/bin/gem2arch"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
