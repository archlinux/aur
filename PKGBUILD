pkgname=simple-deadlock-mod-manager
pkgver=0.6.3
pkgrel=1
pkgdesc="A simple mod manager for Deadlock"
arch=('x86_64' 'aarch64')
url="https://github.com/Gabri3445/simple-deadlock-mod-manager"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/simple-deadlock-mod-manager_${pkgver}_amd64.deb")
sha256sums_x86_64=('5ffc2b7ec1fcb024b65da4dd3d6efff2684a676d1f259d64aec53301ae37842d')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}