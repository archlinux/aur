# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Source: https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ttf-roboto

pkgname=ttf-autour-one
pkgver=1
pkgrel=1

pkgdesc="Autour One is inspired by handwritten letters on Ludwig Hohlwein posters."
url='https://fonts.google.com/specimen/Autour+One'
arch=('any')
license=('OFL')

depends=('fontconfig')

source=(https://fonts.google.com/download?family=Autour%20One)
md5sums=('038165a26c5a19e84bf7877fd746f279')

package() {
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
