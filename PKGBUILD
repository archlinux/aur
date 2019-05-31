# Maintainer: Max Ferrer (Panda Foss) <maxi.fg13@gmail.com>
pkgname=baph
pkgver=0.6
pkgrel=3
pkgdesc="Basic AUR Package Helper"
arch=('any')
url="https://github.com/PandaFoss/baph"
license=('GPL')
depends=('coreutils' 'pacman-contrib' 'curl')
source=('https://raw.githubusercontent.com/PandaFoss/baph/master/baph')
md5sums=('55365800010330b45842101f0a4e3bf5')

package() {
  cd "${srcdir}"
  install -Dm755 baph "$pkgdir"/usr/bin/baph
}

# vim:set ts=2 sw=2 et:
