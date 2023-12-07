# Maintainer: akku <akku (at) f5.si>
pkgname=ninja-is-samurai
pkgver=2
pkgrel=1
pkgdesc="Replace ninja build with samurai."
arch=('any')
license=('Unlicense')
depends=('samurai')
conflicts=('ninja')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s samu ninja
}
