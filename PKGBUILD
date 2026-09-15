# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=3.9.0
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('eabd06d0cb668b018eb59bc19f1526b2189d56af688c838ac27d9681c2eb33ff')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
