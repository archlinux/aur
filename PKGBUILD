# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="cue2pops"
pkgver=2.0
pkgrel=3
pkgdesc="Convert Playstation Games To VCD for use with POPS."
arch=('x86_64')
url="https://github.com/tallero/cue2pops-linux"
license=('GPL2')
makedepends=('make')
source=("git+$url#branch=pegando-a-manha")
md5sums=(SKIP)

package() {
  cd "${pkgname}-linux"
  make
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
