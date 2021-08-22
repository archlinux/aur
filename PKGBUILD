# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-dodum
pkgver=2.0
pkgrel=1
pkgdesc=""
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Dodum"
source=("Gowun_Dodum.zip::https://fonts.google.com/download?family=Gowun+Dodum")
sha256sums=("bee5f5827d6f4b88b1acd41a9ec16d81ef06ab42f8469bdf774d9b10e256799f")

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
