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
sha256sums_x86_64=('08ac67544974b41928ac5fb2422a9092d33205b50f51f49b974940e189bfb1a0')
sha256sums_aarch64=('818026ceb2786017e989c67d8dbd96ff3cfbd4d6959b73d669572dafe2a56432')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
