# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rooyin-fonts
pkgver=1.1
pkgrel=1
pkgdesc="Rooyin Free font - an English-Arabic Pixel font"
arch=('any')
url="https://github.com/MohamadDarvishi/Rooyin"
license=('OFL')
depends=('fontconfig')
source=("https://github.com/MohamadDarvishi/Rooyin/releases/download/v${pkgver}/Rooyin-Free.zip")
sha256sums=('45d4d0e341d8d1115546b6722711bb3affcc1d0148653bac2e17a08d20494136')

package() {
  install -Dm644 "$srcdir/Font Family/"{RooyinFree-Regular,RooyinFree-Bold,RooyinFree-RegularDots2}.ttf \
    -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/OFL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
