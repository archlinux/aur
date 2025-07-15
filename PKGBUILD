pkgname=garoa
pkgver=0.1.0
pkgrel=1
pkgdesc="Home of discipline"
arch=('x86_64')
url="https://github.com/garoa-app/releases"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Garoa_${pkgver}_amd64.deb")
sha256sums_x86_64=('340753eae6bced73a12a3868e7b159888c50162f5995c837596820b92f6b6ed0')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
