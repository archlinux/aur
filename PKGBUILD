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
sha256sums_x86_64=('f618cd95ee7f0383bbf038f77ed35c8c68e8e229befffc9dddaca15170917059')
sha256sums_aarch64=('c77f34c1e9e426b731575dfefa03bcfaa76f8ad92e32760f360c4a5d0b496fb6')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
