# Maintainer: leeteral <kneesdev@naver.com>
pkgname=duelsplus-bin
pkgver=3.5.5
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
sha256sums=('3bd49b3c167979fd071ab86c8af2a512b710d93526026f81e9b6ef826ab172ac')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
