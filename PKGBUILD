# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=seth
pkgver=0.6.2
pkgrel=1
pkgdesc="The command-line Swiss army knife for Ethereum"
arch=('any')
depends=(curl ethabi jshon)
url="https://github.com/dapphub/seth"
license=(GPL3)
source=(https://github.com/dapphub/seth/archive/v${pkgver}.tar.gz)
sha512sums=('afc337237e182957ab04f2eeddf8f4a1ef4dd6a35ab174c05e74e9e72f09dd2571eba8dad60e5f5890d1100044c62dea2ae6ef02a1808d8d05db49b3b48b17ba')

package() {
  cd $pkgname-$pkgver

  mkdir "$pkgdir"/usr
  make prefix="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
