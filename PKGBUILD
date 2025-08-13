# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=sound-player-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Мощный, кроссплатформенный и лёгкий музыкальный плеер, построенный на Rust и Tauri"
arch=('x86_64')
url="https://github.com/mrkirill046/sound-player"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sound-player_${pkgver}_amd64.deb")
sha256sums_x86_64=('143e6e7ad640a94df693724da96e5dcb31f7688c5ac62dd9018eb6ea2f208226')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
