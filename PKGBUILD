# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_rc.1
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.1/Dropout_0.2.0-rc.1_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.1/Dropout_0.2.0-rc.1_arm64.deb")
sha256sums_x86_64=('48c7e536883e794f24a20de93d65cc49ec4908f9c4749a63d6144b17396515ab')
sha256sums_aarch64=('9c8a896fd973b2333df7e3f2420d66624dd942048a8c3df7c69a14562aaf9c45')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
