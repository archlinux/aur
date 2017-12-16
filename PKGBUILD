# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=seth
pkgver=0.5.11
pkgrel=1
pkgdesc="The command-line Swiss army knife for Ethereum"
arch=('any')
depends=(curl ethabi jshon)
url="https://github.com/dapphub/seth"
license=(GPL3)
source=(https://github.com/dapphub/seth/archive/v${pkgver}.tar.gz)
sha512sums=('ab9ad66845d66e073303a75d1ccfdfb5d0d1da20e1e8d195a8d146d0b7cd3d366f0513cc8f1e30c1477aea1e9a1cbe1e5b89a32f4131e945d53823292f4c0eb1')

package() {
  cd $pkgname-$pkgver

  mkdir "$pkgdir"/usr
  make prefix="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
