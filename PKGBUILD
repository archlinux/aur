# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=ttf-mintysis
pkgver=1.002
pkgrel=2
pkgdesc="A font designed by Hirwen Harendal and released by Arkandis Digital Foundry (TTF version of otf-mintspirit)"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:conflicting information:GPL or OFL 1.1')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install="ttf.install"
source=("http://arkandis.tuxfamily.org/fonts/Mintysis-20120623.zip")

sha256sums=('53774b17a783756037448e15e2756987ff451391a86619285bc9459b80463450')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}"/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}"/*/TTF-AH/*.[Tt][Tt][CcFf] "${pkgdir}"/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}"/*/NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

