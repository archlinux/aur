#Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>

pkgname=ttf-comic-sans
pkgver=5.14
pkgrel=1
pkgdesc='The famous sans-serif font'
url="https://learn.microsoft.com/en-us/typography/font-list/comic-sans-ms"
arch=('any')
license=('custom:Desktop font license')
source=(
    "COMIC.ttf"
    "COMICBD.ttf"
    "COMICI.ttf"
    "COMICZ.ttf"
    "LICENSE"
)
sha256sums=(
    'a7da3ef195158acd8432226a21f2940f1806a9c8d079f18d0a9ab475f50f9659'
    '56567bc71e89fd173674c78f02b474123a02561b246526a22600c3a29b2fdc65'
    '65aece2928246837317e093a11c6df5cbfc67035f1e045c9771f7c408be1faea'
    'c691699eaf218e702b2d77c1f62d2c080be6248f1c11018b0b2556834a9cecb1'
    'SKIP'
)
package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 COMIC.ttf "${pkgdir}/usr/share/fonts/TTF/COMIC.ttf"
    install -m 644 COMICBD.ttf "${pkgdir}/usr/share/fonts/TTF/COMICBD.ttf"
    install -m 644 COMICI.ttf "${pkgdir}/usr/share/fonts/TTF/COMICI.ttf"
    install -m 644 COMICZ.ttf "${pkgdir}/usr/share/fonts/TTF/COMICZ.ttf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
