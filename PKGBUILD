# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=3.7.3
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('11bcbd05959826751ecf47d0f24929c72156198a7628f2a70c4a091b61472479')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
