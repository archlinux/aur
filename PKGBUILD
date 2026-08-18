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
sha256sums_x86_64=('0319615da2624a8de1fcafff8729b83c1a1fbee6c418af99e8c15e082319154c')
sha256sums_aarch64=('974400216240eeea0dc3d308e6a9b5f9a2f5ef5c0ae5ba6b6beb1218653e9fdb')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
