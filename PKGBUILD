# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-shutdowntimer-git
pkgver=21
pkgrel=1
pkgdesc="Shutdown your device after a specific time. This extension adds a submenu to the status area."
arch=('any')
url="https://github.com/neumann89/ShutdownTimer"
license=('unknow')
depends=('gnome-shell')
source=("git+https://github.com/neumann89/ShutdownTimer.git")
sha256sums=('4ac697cf68aa43213845aa5d1b4996d48a269ac27f153712e1bca24207bab9c3')

package() {
  cd "${srcdir}/ShutdownTimer-${pkgver}"

  cp -af "ShutdownTimer@neumann" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
