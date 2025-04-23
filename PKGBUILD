# Maintainer: nerovim <nsydykovich@gmail.com>
pkgname=nerolauncher
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Minecraft Launcher built with NextJS and Tauri"
arch=('x86_64')
url="https://github.com/nsydykovich/nerolauncher"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Nero.Launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('8e5063f37b53fd1712d707928418f652cba5a597c5e78cb00b338d132e1129b8')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}