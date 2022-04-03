# Maintainer: Zweisamkite <snitxmhm@gmail.com>

pkgname=ttf-nothingyoucoulddo
pkgver=1.0
pkgrel=1
pkgdesc='Nothing You Could Do is based on the handwriting of a photographer friend.'
arch=(any)
url="https://fonts.google.com/specimen/Nothing+You+Could+Do#standard-styles"
license=(OFL)
source=("${pkgname}.zip::https://fonts.google.com/download?family=Nothing%20You%20Could%20Do")
sha256sums=('71b0e9610bfbabba89c192fb7aae5f72fc6fa760a3971ac016282099ea0304e2')

package() {
    cd ${srcdir}
    install -dm 755 ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
