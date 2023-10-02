# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=slos-gimpainter
pkgver=20220429
pkgrel=1
arch=('any')
pkgdesc='A brush package for GIMP 2.10.20 or Later'
url="https://github.com/SenlinOS/SLOS-GIMPainter"
license=('MIT')
depends=('gimp')
source=("20220429.zip::https://github.com/SenlinOS/SLOS-GIMPainter/archive/c2550f554dc9e59da343a5fee4e406afcb51c1f1.zip")
sha256sums=('e828a75aafc3de56fad2091f65074c079ed1abe93827017fde6ead067d5b3c06')

package() {
  mkdir -p "$pkgdir/usr/share/gimp/2.0"
  cd SLOS-GIMPainter-master
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  mv {brushes,dynamics,tool-presets} "$pkgdir/usr/share/gimp/2.0"
}
