# Maintainer: Your Name <your-email@example.com>
# This is a binary PKGBUILD that downloads pre-built artifacts from GitHub releases

pkgname=remote-explorer-bin
_pkgname=remote-explorer
pkgver=0.1.8
pkgrel=1
pkgdesc="SSH remote file explorer built with Tauri (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/ErdemGKSL/remote-explorer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Remote.Explorer_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')
source_aarch64=("${url}/releases/download/v${pkgver}/Remote.Explorer_${pkgver}_arm64.deb")
sha256sums_aarch64=('SKIP')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}