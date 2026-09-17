# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('aabf6ae6a725125022e3ea582c10e2e91fd6c6083c5b3edd7a32fbbc81e7233c')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
