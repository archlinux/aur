# Contributor: Piotr Beling <qwak@w8.pl>
# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=eclipsetrader
pkgver=N201301040902
pkgrel=1
pkgdesc="Stock exchange, trading and technical analysis platform"
arch=('x86' 'x86_64')
url="http://www.${pkgname}.org/"
depends=('java-runtime' 'gtk2')
license=('CPL' 'EPL')
source_x86=("http://sourceforge.net/projects/${pkgname}/files/Nightly%20Builds/${pkgver}/${pkgname}-${pkgver}-linux.gtk.x86.tar.gz") 
source_x86_64=("http://sourceforge.net/projects/${pkgname}/files/Nightly%20Builds/${pkgver}/${pkgname}-${pkgver}-linux.gtk.x86_64.tar.gz")
source=("${pkgname}.desktop" "${pkgname}.png")
md5sums_x86=('9d241b82053520bed50389f5b95e840d')
md5sums_x86_64=('7a7d5d382676a0a7bc60b346479f5228')
md5sums+=('231457fa88dac887f9ee9bb52132d897' 'a5827dabe9e2c29199d9ee05c8030cb3')

package() {
    cd ${srcdir}
    install -d "${pkgdir}/usr/share/"
    mv "${pkgname}" "${pkgdir}/usr/share/"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}