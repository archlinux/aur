# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=ttf-krutidev
pkgver=1.0
pkgrel=1
pkgdesc="A popular non-unicode Remington Devanagri font for Hindi"
arch=('any')
url="https://en.wikipedia.org/wiki/Kruti_Dev"
license=('custom')
source=("https://hindityping.info/download/assets/Kruti_Dev_Fonts/Kruti-Dev-Fonts.zip")
md5sums=('SKIP')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/krutidev"
    install -m 644 Kruti_Dev_Fonts/* "${pkgdir}/usr/share/fonts/krutidev/"
}
