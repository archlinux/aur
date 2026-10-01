# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=5.2.2
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('1adf4a40bd6bb0982bf721d37092175d7dc4505ecbbae9330b7deca7a2e847ed')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
