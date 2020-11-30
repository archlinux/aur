# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=ttf-fanwunming
pkgver=1.005
pkgrel=1
pkgdesc="A Simplified-Chinese-to-Traditional-Chinese font based on GenYoMin, which can handle the one-to-many problem"
arch=('any')
url="https://github.com/ayaka14732/FanWunMing"
license=('custom:OFL-1.1')
source=("FanWunMing-Both-$pkgver.zip::$url/releases/download/v$pkgver/FanWunMing-Both.zip")
md5sums=('30cce53b6c136c0f8b3373ab994a36a8')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
