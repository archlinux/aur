# Maintainer: Thomas Haider <t.haider@deprecate.de>

pkgname=ttf-comic-neue
pkgver=2.2
pkgrel=1
pkgdesc="Comic Neue aspires to be the casual script choice for everyone including the typographically savvy."
arch=('any')
license=('custom:OFL')
url="http://comicneue.com"
depends=('fontconfig')
install=ttf-comic-neue.install
source=("http://comicneue.com/comic-neue-${pkgver}.zip" ttf-comic-neue.install)
sha256sums=('d67c7de093b3555a525a29db1999b7759723208f514f5fca117201d63b94b5b6'
            '2459fa08887f819049afac36d7e7e23d7b9f58eb39c35ce02b17ce1096885c16')

package() {
  install -D -m644 comic-neue-${pkgver}/SIL-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 comic-neue-${pkgver}/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
