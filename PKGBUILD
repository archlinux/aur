# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=ttf-fanwunming
pkgver=2.100
pkgrel=1
pkgdesc="A Simplified-Chinese-to-Traditional-Chinese font based on GenYoMin, which can handle context-sensitive cases"
arch=('any')
url="https://github.com/ayaka14732/FanWunMing"
license=('OFL-1.1')
source=("FanWunMing-Both-$pkgver.zip::$url/releases/download/v$pkgver/FanWunMing-Both.zip")
sha256sums=('76e7980d21bd621a19c6c6747ed593e092a4efca97223e4216c97a1956567fc0')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
