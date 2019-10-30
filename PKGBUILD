# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname=blackman
pkgver=0.5.13
pkgrel=1
pkgdesc="Emerge for BlackArch Linux - Download and compile packages as emerge does."
arch=('any')
url=https://github.com/BlackArch/blackman
license=('GPL')
depends=('git' 'subversion')
source=("https://github.com/BlackArch/blackman/archive/v${pkgver}.tar.gz")
sha256sums=('f8502a86733843d2bac7eccbbd107325bfd38ee29210d106370709ffa7654685')

package() {
  cd "$srcdir/blackman-$pkgver"

  install -Dm755 blackman "$pkgdir/usr/bin/blackman"
  install -Dm644 -t "$pkgdir/usr/share/doc/blackman/" README.md TODO
}

