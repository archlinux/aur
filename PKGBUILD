# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-batang
pkgver=2.0
pkgrel=3
pkgdesc="A serif text typeface inspired by neat, pencil-written handwriting letterforms"
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Batang"
source=("Gowun_Batang.zip::https://fonts.google.com/download?family=Gowun+Batang")
sha256sums=('8bdc9874cdf4dc5d4b99b0ea115ce97b4140d8594a4aa748035d986eb99bffaf')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
