# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-shutdowntimer
pkgver=21
pkgrel=0
pkgdesc="Shutdown your device after a specific time. This extension adds a submenu to the status area."
arch=('any')
url="https://github.com/neumann89/ShutdownTimer"
license=('unknow')
depends=('gnome-shell')
source=("https://github.com/neumann89/ShutdownTimer/archive/v${pkgver}.tar.gz")
sha256sums=('4ac697cf68aa43213845aa5d1b4996d48a269ac27f153712e1bca24207bab9c3')

package() {
  cd "${srcdir}/ShutdownTimer-${pkgver}"
  patch -Np0 -i .patch

  cp -af "ShutdownTimer@neumann" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
