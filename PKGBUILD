# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=ttf-fanwunhak
pkgver=1.007
pkgrel=1
pkgdesc="A Simplified-Chinese-to-Traditional-Chinese font based on GenYoGothic, which can handle the one-to-many problem"
arch=('any')
url="https://github.com/ayaka14732/FanWunHak"
license=('custom:OFL-1.1')
source=("FanWunHak-Both-$pkgver.zip::$url/releases/download/v$pkgver/FanWunHak-Both.zip")
sha256sums=('c88f74a4bf38ad4b763634d0a67a63e959c8e6bdceaafa615480ae9ed276799a')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
