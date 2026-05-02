# Maintainer: Manpreet <manpreet@example.com>
pkgname=ax-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast, unified, and feature-complete wrapper for pacman and the AUR"
arch=('x86_64')
url="https://github.com/Manpreet113/ax"
license=('MIT')
depends=('pacman' 'git')
provides=('ax')
conflicts=('ax')
source=("https://github.com/Manpreet113/ax/releases/download/v${pkgver}/ax")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/ax" "${pkgdir}/usr/bin/ax"
}
