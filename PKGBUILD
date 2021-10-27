# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=cue2pops
pkgver=2.0
pkgrel=2
pkgdesc="Convert Playstation Games To VCD for Popstarter"
arch=('any')
url="https://github.com/makefu/cue2pops-linux"
license=('GPL2')
makedepends=('make')
source=("git+$url")
md5sums=(SKIP)

package() {
  cd $pkgname-linux
  make
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
