# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=ttf-navbharati
pkgver=1.0
pkgrel=1
pkgdesc="NavBharati - a font for Bharati script"
arch=('any')
url="https://bharatiscript.com"
license=('custom')
source=("https://bharatiscript.com/media/Fonts/NavBharati.ttf")
md5sums=('SKIP')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 NavBharati.ttf "${pkgdir}/usr/share/fonts/TTF/NavBharati.ttf"
}
