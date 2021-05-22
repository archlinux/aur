# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=ttf-mintysis
_fontname=Mintysis
pkgver=1.002
pkgrel=3
_date=20120623
pkgdesc="A sans-serif font"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:conflicting information:GPL or OFL 1.1')
groups=('ttf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('53774b17a783756037448e15e2756987ff451391a86619285bc9459b80463450')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}"/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}/${_fontname}-${_date}"/TTF-AH/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}/${_fontname}-${_date}"/NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

