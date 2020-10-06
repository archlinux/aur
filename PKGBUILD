# Maintainer: TheNeikos
pkgname=ttf-open-sans-condensed
pkgver=1.0
pkgrel=1
pkgdesc='Open Sans is a humanist sans serif typeface designed by Steve Matteson, Type Director of Ascender Corp.'
arch=('any')
url='https://fonts.google.com/specimen/Open+Sans+Condensed'
license=('Apache License, Version 2.0')
depends=('fontconfig')
source=("${pkgname}.zip::https://fonts.google.com/download?family=Open+Sans+Condensed")
sha256sums=('7cdde7b0a0a572f80c2b80cfb4d7964f05579c386974eaaf6f873fc3035a42c2')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

