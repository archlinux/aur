# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=6.3.0
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('ba564a475e5773b39d69ded5941bb080b934ce5b23f51f1baf8c8e36f3caa5a2')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
