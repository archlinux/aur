# Maintainer: Hugo Chargois <hugo dot chargois at free dot fr>
pkgname=gohufont
pkgver=2.0
pkgrel=3
pkgdesc='A bitmap font for programming and terminal use, in two sizes'
arch=(any)
url=http://font.gohu.eu/
license=(custom:WTFPL)
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=$pkgname.install
source=(http://font.gohu.eu/$pkgname-$pkgver.tar.gz)
md5sums=('f57ed4493447f9c74f53bb8aa27eae7c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  _fonts="$pkgdir/usr/share/fonts/misc"
  install -Dm644 gohufont-11b.pcf.gz "$_fonts/gohufont-11b.pcf.gz"
  install -Dm644 gohufont-11.pcf.gz "$_fonts/gohufont-11.pcf.gz"
  install -Dm644 gohufont-uni-11b.pcf.gz "$_fonts/gohufont-uni-11b.pcf.gz"
  install -Dm644 gohufont-uni-11.pcf.gz "$_fonts/gohufont-uni-11.pcf.gz"
  install -Dm644 gohufont-14b.pcf.gz "$_fonts/gohufont-14b.pcf.gz"
  install -Dm644 gohufont-14.pcf.gz "$_fonts/gohufont-14.pcf.gz"
  install -Dm644 gohufont-uni-14b.pcf.gz "$_fonts/gohufont-uni-14b.pcf.gz"
  install -Dm644 gohufont-uni-14.pcf.gz "$_fonts/gohufont-uni-14.pcf.gz"
  install -Dm644 COPYING-LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING-LICENSE"
}
