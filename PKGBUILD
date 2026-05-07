# Maintainer: Gabriele <castielloangels512@gmail.com>
pkgname=g-helper
pkgver=1.2
pkgrel=1
pkgdesc="Gabriele's lightweight AUR helper for apt-fake integration (v1.2)"
arch=('any')
license=('GPL3')
depends=('bash' 'git' 'pacman' 'curl')
source=('g-helper')
sha256sums=('511935dc39e248fa206e33407cfc17efe00a00d9b46d9ca6f41dec3a7a1d9e5d')

package() {
  install -Dm755 "${srcdir}/g-helper" "${pkgdir}/usr/bin/g-helper"
}
