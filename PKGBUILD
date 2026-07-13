# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_alpha.6
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.6/Dropout_0.2.0-alpha.6_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.6/Dropout_0.2.0-alpha.6_arm64.deb")
sha256sums_x86_64=('8748d56794d517ddeda85a4b6cd27bf9445f08095af8416c93ddf909a470d9ea')
sha256sums_aarch64=('0cb6b26cc5d13d4b81fca34f9afd5bc9abbbabdfdcb42f22ea7aaa57d326a96b')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
