# Maintainer: Gatlin Johnson <gatlin@niltag.net>

pkgname=ttf-comic-neue
pkgver=2.3
pkgrel=1
pkgdesc="Comic Neue aspires to be the casual script choice for everyone including the typographically savvy."
arch=('any')
license=('custom:OFL')
url="http://comicneue.com"
depends=('fontconfig')
install=ttf-comic-neue.install
source=("http://comicneue.com/comic-neue-${pkgver}.zip" ttf-comic-neue.install)
sha256sums=('f3a7500eb477d03a865249dd3fa5ecff516d12d11d5d8494c8164fd4ee842599'
            '2459fa08887f819049afac36d7e7e23d7b9f58eb39c35ce02b17ce1096885c16')

package() {
  install -D -m644 ${srcdir}/SIL-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 ${srcdir}/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
