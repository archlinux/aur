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
sha256sums_x86_64=('7a620280a3f0055eca3c394f2287fd64cd8d3ebf71b7a16c5ae6d94b1fd59c91')
sha256sums_aarch64=('022cf29c08a7020e63a30f4b01c7ba045c41339517f3e0a083f3fca26c0fe4ed')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
