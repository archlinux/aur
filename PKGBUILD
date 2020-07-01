# Maintainer: Hugo Chargois <hugo dot chargois at free dot fr>
pkgname=gohufont
pkgver=2.1
pkgrel=2
pkgdesc='A bitmap font for programming and terminal use, in two sizes'
arch=(any)
url=http://font.gohu.org/
license=(custom:WTFPL)
depends=('xorg-fonts-encodings' 'xorg-fonts-alias-misc')
source=("http://font.gohu.org/$pkgname-$pkgver.tar.gz")
md5sums=('154921c092ac5a4e1806e04d84d6707d')

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
