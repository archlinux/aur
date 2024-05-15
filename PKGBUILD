# Maintainer: TheRealOne78  <bajcsielias78@gmail.com>
# Font Author: Transilvania University of Brașov

pkgname=otf-unitbv-utsans
pkgver=1.0
pkgrel=1

pkgdesc="OpenType UTSans Fonts from the Transilvania University of Brașov"
arch=('any')
url="https://www.unitbv.ro/en/"
license=('custom:UniTBv')

source=("https://intranet.unitbv.ro/Portals/0/Identitate%20vizuala/Fonturi-UT.zip")
sha256sums=('f242d52af7fbc2f2fffebee75a5958357c2a44a956a79b53af48cd4f4827603b')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/otf-unitbv-utsans"
    install -m644 -t "${pkgdir}/usr/share/fonts/otf-unitbv-utsans" *.otf
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/otf-unitbv-utsans/LICENSE"
}
