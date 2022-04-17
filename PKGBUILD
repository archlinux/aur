# Maintainer: Guoyi
pkgname=wtdbg
pkgver=2.5
pkgrel=1
pkgdesc="A fuzzy Bruijn graph approach to long noisy reads assembly"
arch=('x86_64')
url="https://github.com/ruanjue/wtdbg2"
license=('GPL')
depends=()
makedepends=()
optdepends=()
source=(https://github.com/ruanjue/wtdbg2/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('a2ffc8503d29f491a9a38ef63230d5b3c96db78377b5d25c91df511d0df06413')
build() {
  cd "${pkgname}2-$pkgver"
  make
}

package() {
  cd "${pkgname}2-$pkgver"
  install -Dm 755 kbm2 $pkgdir/usr/bin/kbm2
  install -Dm 755 pgzf $pkgdir/usr/bin/pgzf
  install -Dm 755 wtdbg2 $pkgdir/usr/bin/wtdbg2
  install -Dm 755 wtdbg-cns $pkgdir/usr/bin/wtdbg-cns
  install -Dm 755 wtpoa-cns $pkgdir/usr/bin/wtpoa-cns
  
}
