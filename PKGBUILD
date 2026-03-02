# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_alpha.5
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.5/Dropout_0.2.0-alpha.5_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.5/Dropout_0.2.0-alpha.5_arm64.deb")
sha256sums_x86_64=('f6d14a01d8dcdb3db5f0044b1f74a7e62e6ed34e021defe2f06d2be6afca20c2')
sha256sums_aarch64=('940ecafb9688ce45504232fd12c78b8c40ce44b769569929426dcc0629148e99')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
