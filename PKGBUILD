# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=ttf-fanwunhak
pkgver=2.100
pkgrel=1
pkgdesc="A Simplified-Chinese-to-Traditional-Chinese font based on GenYoGothic, which can handle context-sensitive cases"
arch=('any')
url="https://github.com/ayaka14732/FanWunHak"
license=('OFL-1.1')
source=("FanWunHak-Both-$pkgver.zip::$url/releases/download/v$pkgver/FanWunHak-Both.zip")
sha256sums=('377a14e33dccde1fcccf87acd235c0c37102b7da613ce4fc26b9b947c6d22445')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
