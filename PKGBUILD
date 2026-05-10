# Maintainer: leeteral <kneesdev@naver.com>
pkgname=duelsplus-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="Compiled binaries for the Duels+ Launcher"
arch=('x86_64')
url="https://github.com/duelsplus/launcher-tauri"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
# these are included for future compatibility with a potential source-built 'duelsplus' package
# currently they don't affect anything
provides=('duelsplus')
conflicts=('duelsplus' 'duelsplus-git')
install=${pkgname}.install
source=("Duels+.Launcher_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Duels+.Launcher_${pkgver}_amd64.deb")
sha256sums=('54242b49ebbcb0958eb52aaf810028b5d778469957b090a2fa0435851b027366')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
