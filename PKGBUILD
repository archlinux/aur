# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname="ttf-hind"
_reponame=hind
pkgver=2.000
pkgrel=1
pkgdesc='Hind is an Open Source typeface supporting the Devanagari and Latin scripts.'
arch=(any)
url="https://fonts.google.com/specimen/Hind"
license=(OFL)
source=("${pkgname}.zip::https://fonts.google.com/download?family=Hind")
sha512sums=('81c8541bc146f19898dc9c9a83e46ae53d4aaed92a231b6f0c9abf4e90764b89e3833aece12a1940e9811909bf336f4d93506b3073a6133799dd1a57138b9f21')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
