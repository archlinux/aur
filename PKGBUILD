# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-shutdowntimer
pkgver=21
pkgrel=1
pkgdesc="Shutdown your device after a specific time. This extension adds a submenu to the status area."
arch=('any')
url="https://github.com/neumann89/ShutdownTimer"
license=('unknow')
depends=('gnome-shell')
source=("git+https://github.com/neumann89/ShutdownTimer.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/ShutdownTimer-${pkgver}"

  cp -af "ShutdownTimer@neumann" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
