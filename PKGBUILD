# Maintainer: kormpu mcgpapu@gmail.com

pkgname="ttf-tr2n"
pkgdesc="tr2n ttf font"
pkgver=1.3
pkgrel=3
arch=('any')
url="https://www.ffonts.net/TR2N.font"
source=("https://www.ffonts.net/TR2N.font.zip")
license=('OFL')
depends=('fontconfig' 'xorg-mkfontscale')
makedepends=('unzip')
b2sums=('e83816a9f69c3409cfc39d27bc2524d9728bf42320d5dd1a376055f676967c74c27de2d2fd19860334cecdcee2bac8920ef156bfeff8696b23835d937e163425')

package() {
install -Dm644 -v "${srcdir}/Tr2n.ttf" -t "$pkgdir/usr/share/fonts/${pkgname}"
install -Dm644 -v "${srcdir}/License.txt" -t "$pkgdir/usr/share/licenses/${pkgname}"
install -Dm644 -v "${srcdir}/Readme.txt" -t "$pkgdir/usr/share/doc/${pkgname}"
}
