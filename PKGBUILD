# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ggh-git
pkgver=r12.7e9d2c9
pkgrel=1
pkgdesc='Git Gerrit Helper'
arch=(any)
url='https://github.com/hobbs/ggh'
license=(unknown)
depends=(git bash)
makedepends=(git)
source=(git+https://github.com/hobbs/ggh.git)
sha512sums=('SKIP')

pkgver() {
  cd ggh
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ggh
  install -D -m755 ggh "$pkgdir"/usr/bin/ggh
}
