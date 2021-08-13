# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=fonts-vegur
pkgver=0.701
pkgrel=2
pkgdesc="Vegur outline fonts"
arch=('any')
url="https://www.dotcolon.net/font/vegur"
license=('custom')
depends=('fontconfig')
_zipver="0701"
source=("https://dotcolon.net/download/fonts/vegur_${_zipver}.zip"
        "COPYING::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
)
sha256sums=('cfb06f0860aae4a6ed0ffaba4ab749a7c09c7f482e68a284a6f832c8382669ed'
            'SKIP'
)

package() {
  cd ${srcdir}

  install -d "${pkgdir}/usr/share/fonts/Vegur/"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/Vegur/"

  install -D -m644 "${startdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
