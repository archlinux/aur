# Maintainer: diegul

pkgname=xpanel-desktop-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A cross-platform Electron wrapper for Finalmouse XPANEL, bringing WebHID support to desktop."
arch=('x86_64')
url="https://github.com/diegul/xpanel-desktop"
license=('MIT')
depends=('glibc' 'gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils')
provides=('xpanel-desktop')
conflicts=('xpanel-desktop')
source=("https://github.com/diegul/xpanel-desktop/releases/latest/download/xpanel-desktop-linux-x86_64.AppImage"
        "xpanel-desktop.desktop"
        "xpanel-desktop.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/xpanel-desktop-linux-x86_64.AppImage" "${pkgdir}/usr/bin/xpanel-desktop"
  install -Dm644 "${srcdir}/xpanel-desktop.desktop" "${pkgdir}/usr/share/applications/xpanel-desktop.desktop"
  install -Dm644 "${srcdir}/xpanel-desktop.png" "${pkgdir}/usr/share/pixmaps/xpanel-desktop.png"
}
