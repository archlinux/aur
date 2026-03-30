# Maintainer: ethermawe <ethermawe@yandex.com>
pkgname=pulsesync-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Приложение для модификации Yandex Music"
arch=('x86_64')
url="https://github.com"
license=('GPL')
depends=('hicolor-icon-theme' 'desktop-file-utils')
provides=('pulsesync')
conflicts=('pulsesync')
source=("https://github.com/ethermawe/PulseSync-AUR/releases/download/v1.0.0/PulseSync-amd64.tar.gz")
sha256sums=('0b717d8c43107467fb854628a1b12ec6bd16d68af6ce3214591c9449a83c7c94')

package() {
    cp -rp "${srcdir}/usr" "${pkgdir}/"
    cp -rp "${srcdir}/opt" "${pkgdir}/"
}
