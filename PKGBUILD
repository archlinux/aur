# ttf-apple-kid
# Maintainer: Sterophonick

pkgname=ttf-apple-kid
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="EarthBound Text Box Font"
source=(https://www.ffonts.net/Apple-Kid-Regular.font.zip)
md5sums=('bca74b2cf7f36752259b29a843b42cb4')

package() {
	mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/fonts"
    cp apple_kid.ttf "${pkgdir}/usr/share/fonts"
}

