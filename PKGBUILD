# Maintainer: HsiangNianian <i@jyunko.cn>
# Contributor: 苏向夜 <fu050409@163.com>
pkgname=dropout-bin
pkgver=0.2.0_alpha.4
pkgrel=1
pkgdesc="A modern, reproducible, and developer-grade Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/HydroRoll-Team/DropOut"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=dropout-bin.install
source_x86_64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.4/Dropout_0.2.0-alpha.4_amd64.deb")
source_aarch64=("https://github.com/HydroRoll-Team/DropOut/releases/download/dropout-v0.2.0-alpha.4/Dropout_0.2.0-alpha.4_arm64.deb")
sha256sums_x86_64=('8f2eec6ea6b1101b098e87951d5d0da7a8e3e5630d290e2b559b22a560613e67')
sha256sums_aarch64=('9eca078601efc52ff98292bb6bce399f47304bea0ae29978fac6081493a9d372')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
