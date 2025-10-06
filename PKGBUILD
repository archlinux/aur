pkgname=garoa-beta
pkgver=0.5.0~beta.0
_upstream=0.5.0-beta.0
pkgrel=1
pkgdesc="Home of discipline (Beta release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${_upstream}/Garoa.Beta_${_upstream}_amd64.deb")
sha256sums_x86_64=('aaa8b4d7dbc114fc6e38c7d9bb576a2bfbabe0b91219b5bad4053d7c97f69b4e')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
