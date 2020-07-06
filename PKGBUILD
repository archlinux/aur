# Maintainer: Gatlin Johnson <gatlin@niltag.net>

pkgname=ttf-comic-neue
pkgver=2.5
pkgrel=1
pkgdesc="Comic Neue aspires to be the casual script choice for everyone including the typographically savvy."
arch=('any')
license=('custom:OFL')
url="http://comicneue.com"
install=ttf-comic-neue.install
source=("http://comicneue.com/comic-neue-${pkgver}.zip" ttf-comic-neue.install)
sha256sums=('6496cfef47c67568fb74dfb0609239f9da2368001438573c0e29e3a33fa8e0d9'
            '2459fa08887f819049afac36d7e7e23d7b9f58eb39c35ce02b17ce1096885c16')

package() {
  install -D -m644 ${srcdir}/comic-neue-${pkgver}/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 ${srcdir}/comic-neue-${pkgver}/OTF/ComicNeue/*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
