# Maintainer: Eugen Zagorodniy <https://github.com/ezag>

pkgname=libmsp430
pkgver=3_14_0_000
pkgrel=1
pkgdesc='MSP Debug Stack library (e.g. for using mspdebug with tilib driver)'

arch=('x86_64')
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPDS/latest/index_FDS.html"
license=('custom')

source=(
    "http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPDS/latest/exports/MSP430_DLL_Developer_Package_Rev_$pkgver.zip"
)
sha256sums=('2f4cbafe1c844618245e60cf0e63ea1773763b092834dfb57c8728d6de73c9be')

package() {
    install -D "$srcdir/${pkgname}_64.so" "$pkgdir/usr/lib/${pkgname}.so"
}
