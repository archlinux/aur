# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_rc.2
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.2/Dropout_0.2.0-rc.2_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-rc.2/Dropout_0.2.0-rc.2_arm64.deb")
sha256sums_x86_64=('7e439aa39513ccc145bf1f321f0374cbf872eb6ad9313451ed398bd64e0ed217')
sha256sums_aarch64=('b92c3dbd9481fbbb7dfd6b32da23f6523d232f00ecdd411eab2afc1e2e96eccd')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
