# Maintainer: oddity <you@example.com>
pkgname=30nama-bin
pkgver=1.0
pkgrel=1
pkgdesc="30nama binary release"
arch=('x86_64')
url="https://30nama.com"
license=('custom')
depends=()
options=(!strip)

source=("https://cdn.30store.click/30nama-1.4.2.AppImage"
        "30nama.desktop"
        "30nama.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # Install binary
  install -Dm755 "${srcdir}/30nama-1.4.2.AppImage" \
  "${pkgdir}/usr/bin/30nama"

  # Desktop entry
  install -Dm644 "${srcdir}/30nama.desktop" \
    "${pkgdir}/usr/share/applications/30nama.desktop"

  # Icon
  install -Dm644 "${srcdir}/30nama.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/30nama.png"
}

