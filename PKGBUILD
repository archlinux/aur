# Maintainer: JarzaClay <icdubs09+aur at gmail dot com>

_pkgname=equicord-hook
pkgname=equicord-hook
pkgdesc='Pacman hook to automatically install equicord on discord update'
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL3')
sha256sums=('bd3f0a66e0e00fe507918e3a9511d0dea6257962e92a41fa0f6007dec96cd282')
depends=(
  'bash'
  'coreutils'
  'curl'
  'sed'
  'discord'
)
optdepends=(
  'equicord-installer-bin: Equilotl'
)
source=('equicord.hook')

package() {
  install -Dm644 "equicord.hook" "$pkgdir/etc/pacman.d/hooks/equicord.hook"
}

