# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=6.5.1
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('bc1e65084f26245d26bbbf6359dd806f984b25d96c6b2185f2c9092fe88fb370')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
