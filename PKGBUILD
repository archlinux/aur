# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-wallpapers
pkgver=5.3
pkgrel=1
pkgdesc='Collection of wallpapers for elementary OS'
arch=('any')
url='https://github.com/elementary/wallpapers'
license=('GPL3')
groups=('pantheon')
makedepends=('git')
options=('!emptydirs')
source=("elementary-wallpapers::git+https://github.com/elementary/wallpapers.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd elementary-wallpapers

  install -dm 755 "${pkgdir}"/usr/share/backgrounds/elementary
  install -m 644 *.jpg "${pkgdir}"/usr/share/backgrounds/elementary/
  install -m 644 elementaryos-default "${pkgdir}"/usr/share/backgrounds/
}

# vim: ts=2 sw=2 et:
