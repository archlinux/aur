# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_rc.2
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.2/Dropout_0.2.0-rc.2_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.2/Dropout_0.2.0-rc.2_arm64.deb")
sha256sums_x86_64=('be086ae3ce5a9af69f64961035be56156c5861d4fa355d2c85922d9e1cd99069')
sha256sums_aarch64=('4d2c36b2faf4c007f6697134b4ffe2fab6c8e0d0b42079b9ff81d478b35557e0')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
