# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=otf-kikai-chokoku-jis
pkgver=0.301
pkgrel=1
pkgdesc="A standard font for sculpture standarized in JIS. 機械彫刻用標準書体フォント"
arch=('any')
url='https://font.kim'
license=('custom')
source=(https://font.kim/ki-cho-jis_0301.zip)
sha256sums=('55fe1a39a5d4a5c80903838f2fbc92409a999eeaf80b00ddc35c8d3c3217b4ee')

package() {
  install -Dm644 *.otf -t "$pkgdir"/usr/share/fonts/OTF
  install -Dm644 readme[utf-8].txt "$pkgdir"/usr/share/licenses/"$pkgname"/readme[utf-8].txt
}
