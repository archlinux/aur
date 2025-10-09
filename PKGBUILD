# Maintainer: envolution
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: Christian Brassat <christian.brassat@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-frippery
pkgver=49.0
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=46.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
sha256sums=('4044653f052548189535ad7cd3531ceaa77a7a4c0d11636e738915dea1be3d87')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}
# vim:set ts=2 sw=2 et:
