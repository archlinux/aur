# Maintainer: Eugen Zagorodniy <https://github.com/ezag>
# Maintainer: Flinner Yuu <flinner@nand.sh>

pkgname=libmsp430
pkgver=3_15_1_1
pkgrel=1
pkgdesc='MSP Debug Stack library (e.g. for using mspdebug with tilib driver)'

arch=('x86_64')
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPDS/latest/index_FDS.html"
license=('custom')

source=(
    "https://dr-download.ti.com/software-development/driver-or-library/MD-1nw0DC7bd1/3.15.1.1/MSP430_DLL_Developer_Package_Rev_$pkgver.zip"
)
sha256sums=('0b8a0672dfd02e37b60a74a7cf1469c98d6fbb9716923aeee27863b878d63ad4')

package() {
    install -D "$srcdir/${pkgname}_64.so" "$pkgdir/usr/lib/${pkgname}.so"
}
