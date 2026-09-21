# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('818e3c6d9789371be5ad2fa9c20cdb1b359bebbf618786b2767db85518465160')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
