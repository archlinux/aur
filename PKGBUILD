# Maintainer: akku <akku (at) f5.si>
pkgname=ninja-is-samurai
pkgver=1
pkgrel=1
pkgdesc="Replace ninja build with samurai."
arch=('any')
license=('Unlicense')
depends=('samurai')
conflicts=('ninja')

package() {
  mkdir -p $pkgdirusr/bin
  ln -s usr/bin/samu $pkgdirusr/bin/ninja
}
