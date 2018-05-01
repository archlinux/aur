# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-shutdowntimer-git
pkgver=v21.r26.ged888fe
pkgrel=0
pkgdesc="Shutdown your device after a specific time. This extension adds a submenu to the status area."
arch=('any')
url="https://github.com/neumann89/ShutdownTimer"
license=('unknow')
depends=('gnome-shell')
source=("git+https://github.com/neumann89/ShutdownTimer.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/ShutdownTimer"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "ShutdownTimer@neumann" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
