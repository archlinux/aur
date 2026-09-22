# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=4.9.1
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('9057b74548b141c90d06a04d94efc61afff2d5762e38896b40c3b9aa1ca56329')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
