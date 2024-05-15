# Maintainer: TheRealOne78 <bajcsielias78@gmail.com>
# Font Author: Transilvania University of Brașov

pkgname=ttf-unitbv-utsans
pkgver=1.0
pkgrel=1

pkgdesc="TrueType UTSans Fonts from the Transilvania University of Brașov"
arch=('any')
url="https://www.unitbv.ro/en/"
license=('custom:UniTBv')

source=("https://intranet.unitbv.ro/Portals/0/Identitate%20vizuala/UT-Sans-TTF.zip")
sha256sums=('842607b9dd6c8180bfcfdfaea56bdf0e3ca58013be078177ca154e6bb7fb4e2b')

package() {
    cd UT-Sans-TTF
    install -dm755 "${pkgdir}/usr/share/fonts/ttf-unitbv-utsans"
    install -m644 -t "${pkgdir}/usr/share/fonts/ttf-unitbv-utsans" *.ttf
    install -Dm644 "../../LICENSE" "${pkgdir}/usr/share/licenses/ttf-unitbv-utsans/LICENSE"
}
