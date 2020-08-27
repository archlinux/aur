# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Source: https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ttf-roboto

pkgname=ttf-gamja-flower
pkgver=1
pkgrel=1

pkgdesc="Gamja Flower is a Korean and Latin font that reflects the graceful impression of the potato flower through the form and texture of pen writing with a rhythmic baseline."
url='https://fonts.google.com/specimen/gamja+flower'
arch=('any')
license=('OFL')

depends=('fontconfig')

source=(https://fonts.google.com/download?family=Gamja%20Flower)
md5sums=('4f1c8ed5f4321ee15fe92531b5b6a528')

package() {
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
