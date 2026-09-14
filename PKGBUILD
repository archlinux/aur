# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=3.7.2
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('63b807ebad76c8e15adcba646435790afb0af1cee540908482c6f098b43e4b72')

package() {
    cp -r "${srcdir}/usr" "${pkgdir}/"
}
