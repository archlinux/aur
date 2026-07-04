# Maintainer: Twilight <twilight@aliveos.org>
# AUR package: aliveos-assets
# Sources from GitHub release archive.

pkgname=aliveos-assets
pkgver=2.0.0
pkgrel=1
pkgdesc="Distro identity assets for AliveOS: wallpapers and system logo"
arch=('any')
url="https://github.com/Twilight0/aliveos-assets"
license=('GPL3')
depends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # --- System logo (pixmaps) ---
  install -Dm644 "pixmaps/aliveos-logo.png" "${pkgdir}/usr/share/pixmaps/aliveos-logo.png"

  # --- Wallpapers ---
  install -d "${pkgdir}/usr/share/backgrounds/aliveos"
  cp -a "backgrounds/aliveos/." "${pkgdir}/usr/share/backgrounds/aliveos/"
}