# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-dodum
pkgver=2.0
pkgrel=3
pkgdesc="A humanist sans-serif typeface with a touch of hand movement."
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Dodum"
source=("Gowun_Dodum.zip::https://fonts.google.com/download?family=Gowun+Dodum")
sha256sums=('c8e4c444430d6e3cb56989fd8eb2623cbe5f35a9c586524d26c588d9dfdf048c')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
