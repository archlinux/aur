# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-batang
pkgver=2.0
pkgrel=2
pkgdesc="A serif text typeface inspired by neat, pencil-written handwriting letterforms"
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Batang"
source=("Gowun_Batang.zip::https://fonts.google.com/download?family=Gowun+Batang")
sha256sums=("63b53ed24bb538b55893e08a1cd21d2c93c8d439758d8da9a02d5454f06fb789")

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
