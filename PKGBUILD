# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=gods-extra-music
pkgver=0.9
pkgrel=1
pkgdesc='Gods Deluxe, mp3 music pack'
arch=('any')
url='http://jotd.pagesperso-orange.fr/gods/'
license=('custom')
depends=('gods')
source=('http://jotd.free.fr/gods/Gods_extra_music.zip')
sha256sums=('0b92f6e8a056362af481343df2e31eb001b55e43065556e6f4c625b8933c9ca7')

package() {
  install -d "$pkgdir"/usr/share/{gods,licenses/$pkgname}
  cp -r Gods/music "$pkgdir"/usr/share/gods
  ln -s /usr/share/licenses/gods/readme.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/readme.txt
}
