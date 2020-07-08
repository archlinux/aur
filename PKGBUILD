# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

_srcname=peak-linux-driver
pkgname=peak-linux-headers
pkgver=8.10.2
pkgrel=1
pkgdesc='Linux headers for PEAK CAN adapter'
arch=('x86_64')
url='https://www.peak-system.com/fileadmin/media/linux/index.htm'
license=('GPL2')
source=(
    "https://www.peak-system.com/fileadmin/media/linux/files/${_srcname}-${pkgver}.tar.gz"
)
sha256sums=(
    "766dc4d569c984c5fdcb9446dd3d7a0907627238f56cf1151d20a38c4747361c"
)

package() {
    # move headers to /usr/include
    install -d "${pkgdir}/usr/include"
    install -Dm644 "${_srcname}-${pkgver}/driver/pcan.h" "${pkgdir}/usr/include"
    install -Dm644 "${_srcname}-${pkgver}/driver/pcanfd.h" "${pkgdir}/usr/include"
}
