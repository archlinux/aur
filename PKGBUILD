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
sha256sums_x86_64=('c207d25c3fea785d67db4f3add8249774eaac3c37596218fef4098206748ad23')
sha256sums_aarch64=('7b534fd2ecfe4ec76f607887c348827a6b268aa73944be5bbf2074004dc2668b')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
