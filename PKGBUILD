# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

_srcname=peak-linux-driver
pkgname=peak-linux-headers
pkgver=8.12.0
pkgrel=1
pkgdesc='Linux headers for PEAK CAN adapter'
arch=('x86_64')
url='https://www.peak-system.com/fileadmin/media/linux/index.htm'
license=('GPL2')
source=(
    "https://www.peak-system.com/fileadmin/media/linux/files/${_srcname}-${pkgver}.tar.gz"
)
sha256sums=(
    "f1692a78a948f3847abdd14689ae24f9eb00ead9f3bf2b6f875f5d905fb3cdcd"
)

package() {
    # move headers to /usr/include
    install -d "${pkgdir}/usr/include"
    install -Dm644 "${_srcname}-${pkgver}/driver/pcan.h" "${pkgdir}/usr/include"
    install -Dm644 "${_srcname}-${pkgver}/driver/pcanfd.h" "${pkgdir}/usr/include"
}
