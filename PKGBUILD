# Maintainer: Guillermo Pérez García <gperezgar@tutanota.com>

pkgname=ttf-manrope
pkgver=4.505
pkgrel=1
pkgdesc="A modern sans-serif font family designed by Sharanda Mikhail in 2018-2021"
url="https://github.com/sharanda/manrope"
arch=("any")
license=("OFL")
source=("$pkgname-$pkgver.tar.gz::$url/archive/master.tar.gz")
sha256sums=('679043417b0ea58d1311d40f157d3e2167bc3aacc62791851f81144256b3e5ae')

package() {
  cd manrope-master
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" fonts/ttf/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
