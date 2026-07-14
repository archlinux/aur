# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_alpha.6
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.6/Dropout_0.2.0-alpha.6_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.6/Dropout_0.2.0-alpha.6_arm64.deb")
sha256sums_x86_64=('6cf7ac6593514eb71896d8c1337cad3a0b9c0a0558c5f5c1d63df88d0cf896b3')
sha256sums_aarch64=('b080c70fd945b9f8645624c78a3163eb67ec923272fa1b7a7331f22f4f086b65')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
