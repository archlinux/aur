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
sha256sums_x86_64=('7fd47c5e18cff3c30ce4d6e9856a00a376cced4a1c67fafb0ed7b042648e31e3')
sha256sums_aarch64=('8c5cdb4d4ad2612bbb99df3a8b680435342e9b43e1b9f121548909520ab4c14e')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
