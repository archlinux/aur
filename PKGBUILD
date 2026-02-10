# Maintainer: jpeggdev <https://github.com/jpeggdev>
pkgname=api-dev-studio-bin
pkgver=0.4.26
pkgrel=1
pkgdesc="All-in-one local API development tool - mock servers, proxy recording, request inspection"
arch=('x86_64')
url="https://apidevstudio.com"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
provides=('api-dev-studio')
conflicts=('api-dev-studio')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/jpeggdev/api-dev-studio/releases/download/v${pkgver}/API-Dev-Studio_${pkgver}_amd64.deb")
sha256sums=('4a861eae1ac67134032cc9885a9b916b451fb256f289a655b12a4723f1f4b1cf')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}
