pkgname='volla-messages-bin'
pkgver=0.12.8
pkgrel=1
pkgdesc='Private chat for Android and Desktop environments.'
arch=('x86_64' 'aarch64')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
license=('LICENSE.txt')
options=('!strip' '!debug')
provides=('volla_messages')
url='https://github.com/HelloVolla/volla-messages'

source_x86_64=("${url}/releases/download/v${pkgver}/Volla.Messages_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Volla.Messages_${pkgver}_arm64.deb")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

install=${pkgname}.install

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}