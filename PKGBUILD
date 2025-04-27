# Maintainer: JarzaClay <icdubs09+aur at gmail dot com>

_pkgname=equicord-hook
pkgname=equicord-hook
pkgdesc='Pacman hook to automatically install Equicord on Discord updates'
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL3')
depends=(
  'bash'
  'coreutils'
  'curl'
  'sed'
  'discord'
)
optdepends=(
  'equicord-installer-bin: Equilotl installer for Equicord'
)
source=(
  'equicord.hook'
  'equicord.sh'
)
sha256sums=(
  'SKIP' # You probably want to calculate real checksums later
  'SKIP'
)

package() {
  install -Dm644 "equicord.hook" "$pkgdir/etc/pacman.d/hooks/equicord.hook"
  install -Dm755 "equicord.sh" "$pkgdir/etc/pacman.d/hookbin/equicord.sh"
}

