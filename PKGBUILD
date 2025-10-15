# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-batang
pkgver=2.0
pkgrel=5
pkgdesc="A serif text typeface inspired by neat, pencil-written handwriting letterforms"
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Batang"
source=("https://github.com/yangheeryu/Gowun-Batang/raw/refs/heads/master/fonts/ttf/GowunBatang-Regular.ttf"
        "https://github.com/yangheeryu/Gowun-Batang/raw/refs/heads/master/fonts/ttf/GowunBatang-Bold.ttf"
        "https://github.com/yangheeryu/Gowun-Batang/blob/master/OFL.txt")
sha256sums=('466c593e7147412e748af4856d5ad14709b5a860bdf62b9c2546f2c5874e9849'
            'dbfcaa646e5831e7478524924f02906f550285a5050699b4e38c9950b3ec4b94'
            '0670791619ae64dd5f027437a7ed7745aa184ea6111f70618310155202c1a085')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
