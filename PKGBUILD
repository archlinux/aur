# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="A GUI app for Omarchy."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_amd64.deb")
sha256sums_x86_64=('78a820f682cf1b419f60bbb9b1aec80f5f21e727404d5989b189e1e78c51de4f')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}