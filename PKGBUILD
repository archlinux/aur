# Maintainer: Siddartha Nepal <siddarthanepal5@gmail.com>
# Contributor: Siddartha Nepal <siddarthanepal5@gmail.com>
pkgname=mrsapp
pkgver=0.1.0
pkgrel=1
pkgdesc="Movie Recommendation System"
arch=('x86_64')
url="https://github.com/siddarthan007/siddarthan007"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/siddarthan007/siddarthan007/releases/download/v$pkgver/mrsapp_"$pkgver"_amd64.deb")
sha256sums_x86_64=('79dc59bfff303b34fe579cdd4b39c932d01b89b33d2ef11d7f9d3b04c45fb43a')
package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}