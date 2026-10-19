# Maintainer: mestik78 mestik78@gmail.com

pkgname=omacal-bin
pkgver=5.8.0
pkgrel=1
pkgdesc="Native desktop calendar for Google Calendar, iCloud and any CalDAV server"
arch=('x86_64')
url="https://omacal.app/"
license=('unknown')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('omacal')
conflicts=('omacal')
source=("${pkgname}-${pkgver}.deb::https://github.com/x3me/omacal/releases/download/v${pkgver}/omacal_${pkgver}_amd64.deb")
sha256sums=('d36d4f59bd8a4d62e09880376189e2f5f21491eee4a32dba14034917d49b3abf')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
