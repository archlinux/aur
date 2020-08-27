# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Source: https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ttf-roboto

pkgname=ttf-gaegu
pkgver=1
pkgrel=1

pkgdesc="Gaegu is a Korean and Latin font that features various facial expressions and fairytale-like images using freeform pen writing"
url='https://fonts.google.com/specimen/Gaegu'
arch=('any')
license=('OFL')

depends=('fontconfig')

source=(https://fonts.google.com/download?family=Gaegu)
md5sums=('b429c9f61fb935a71246705d31ed0ab8')

package() {
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
