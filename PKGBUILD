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
sha256sums_x86_64=('9e898f14da9462b531e04d87a04b30bf3983986545231846699fba0bd9c7b921')
sha256sums_aarch64=('2b5c6610ac73c8adb01b8c6ebdfa3355c711912975ffd0086622fe77983fd2ea')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
