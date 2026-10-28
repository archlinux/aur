pkgname=simple-deadlock-mod-manager
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple mod manager for Deadlock"
arch=('x86_64' 'aarch64')
url="https://github.com/jayyd-kit/simple-deadlock-mod-manager"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/simple-deadlock-mod-manager_${pkgver}_amd64.deb")
sha256sums_x86_64=('51ff9df15d2b407b88edf4e80834136de08791e9e562e80751a76649f5c80880')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}