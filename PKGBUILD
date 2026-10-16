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
sha256sums_x86_64=('ee3e9ea6f81fd98058ebc963841978517d0fa1fd1183e1a78d178b76fcb984a9')
sha256sums_aarch64=('cd158833117c529259430546ec6aa80cb013ddedb6a0cf3bb2ed7f2d9709acbe')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
