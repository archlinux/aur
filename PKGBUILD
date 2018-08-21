# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=elm-platform-bin
_pkgname=elm-platform

pkgver=0.19.0
pkgrel=2
pkgdesc="Bundle of all core development tools for Elm"
url="https://github.com/elm/compiler"
license=('BSD-3-Clause')
arch=('x86_64')
depends=(ncurses5-compat-libs)
conflicts=(elm-platform)
makedepends=()

source=(binaries-for-linux-${pkgver}.tar.gz::https://github.com/elm/compiler/releases/download/${pkgver}/binaries-for-linux.tar.gz)
sha512sums=('7a68a8ffd795e89a4587f6959c820ffbc9abfea5e30fec3de70cc9521097d3d9b45ed1cf671f9f45833a366f771f9805df28866117d53e8e29b9557cd492bd31')

package() {
  install -d $pkgdir/usr/bin
  install -m755 elm $pkgdir/usr/bin/elm
}
