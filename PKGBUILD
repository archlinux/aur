# Maintainer: leeteral <kneesdev@naver.com>
pkgname=duelsplus-bin
pkgver=3.5.3
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
sha256sums=('0e849026660300490f90e85c4398b9c32fd2be96c92499b277e95a00895e8ae6')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
