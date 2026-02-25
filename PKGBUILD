# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_alpha.3
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.3/Dropout_0.2.0-alpha.3_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.3/Dropout_0.2.0-alpha.3_arm64.deb")
sha256sums_x86_64=('16d425a8c54c77d5a7ceb8f9a794e81ede67e229b1de5f7ea64974a611f04c5c')
sha256sums_aarch64=('a44b094b389fdc73c2371b4bb219e09d44edece42ec5a0f20f2c894df0a296c7')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
