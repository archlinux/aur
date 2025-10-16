# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-batang
pkgver=2.0
pkgrel=6
_commit=4e73f5a9a004927220354f4b68a4c720da538147
pkgdesc="A serif text typeface inspired by neat, pencil-written handwriting letterforms"
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Batang"
source=("https://github.com/yangheeryu/Gowun-Batang/raw/$_commit/fonts/ttf/GowunBatang-Regular.ttf"
        "https://github.com/yangheeryu/Gowun-Batang/raw/$_commit/fonts/ttf/GowunBatang-Bold.ttf"
        "https://github.com/yangheeryu/Gowun-Batang/raw/$_commit/OFL.txt")
sha256sums=('466c593e7147412e748af4856d5ad14709b5a860bdf62b9c2546f2c5874e9849'
            'dbfcaa646e5831e7478524924f02906f550285a5050699b4e38c9950b3ec4b94'
            '49a57cc769fa9affd6eefb9070a61e3d3f6b757c97cafb15848bc6d1c81acc78')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
