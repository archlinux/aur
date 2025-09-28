# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gowun-dodum
pkgver=2.0
pkgrel=4
pkgdesc="A humanist sans-serif typeface with a touch of hand movement."
arch=('any')
license=('OFL')
url="https://github.com/yangheeryu/Gowun-Dodum"
source=("https://github.com/yangheeryu/Gowun-Dodum/raw/refs/heads/master/fonts/ttf/GowunDodum-Regular.ttf"
        "https://raw.githubusercontent.com/yangheeryu/Gowun-Dodum/refs/heads/master/OFL.txt")
sha256sums=('a6e457933227483a11758fd0947bc74422a106d46f0bf057fdaa5af94a30067d'
            'a7c73f9521cd646bbdfb6684c99a62311bbd7bce11898dc11ef0b3c69eda1aca')
package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
