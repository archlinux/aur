pkgname=garoa
pkgver=0.4.0
pkgrel=1
pkgdesc="Home of discipline (Stable release channel)"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Garoa_${pkgver}_amd64.deb")
sha256sums_x86_64=('7a5116921f774f08f9cdaf7535f7e8666861538f481c2aa0bc9a419cba79ad11')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
