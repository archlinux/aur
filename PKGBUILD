# Maintainer: Nilas Tim Schüsler <nilasschusler at gmail dot com>
pkgname="otb-uw_ttyp0"
pkgver=1.3
pkgrel=1
pkgdesc="Bitmap monospaced font with unicode support and powerline symbols"
arch=("any")
url="http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0"
license=("custom:TTYP0")
conflicts=("uw-ttyp0-font")
md5sums=('b7dd09a73936851b7751a9d4f9cdcce6'
         '5a0764e704a1ea352533ce018645df29'
         'c930c72646a59161125dc03801421e5e'
         '939cef4d4d6fa3d4124b9116a0121408')

source=(
    "${pkgname}-${pkgver}-bold.otb::https://github.com/9las/uw_ttyp0/raw/master/font/UW-Ttyp0-Bold.otb"
    "${pkgname}-${pkgver}-italic.otb::https://github.com/9las/uw_ttyp0/raw/master/font/UW-Ttyp0-Italic.otb"
    "${pkgname}-${pkgver}.otb::https://github.com/9las/uw_ttyp0/raw/master/font/UW-Ttyp0.otb"
    "${pkgname}-${pkgver}-ttyp0::https://raw.githubusercontent.com/9las/uw_ttyp0/master/TTYP0"
)
package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/OTB"
    install -m 644 "${pkgname}-${pkgver}-bold.otb" "${pkgdir}/usr/share/fonts/OTB/UW-Ttyp0-Bold.otb"
    install -m 644 "${pkgname}-${pkgver}-italic.otb" "${pkgdir}/usr/share/fonts/OTB/UW-Ttyp0-Italic.otb"
    install -m 644 "${pkgname}-${pkgver}.otb" "${pkgdir}/usr/share/fonts/OTB/UW-Ttyp0.otb"
    install -Dm644 "${pkgname}-${pkgver}-ttyp0" "${pkgdir}/usr/share/licenses/$pkgname/TTYP0"
}
