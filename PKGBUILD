# Maintender: Popolon <popolon@popolon.org>
# Contributor: David Bailey <david.bailey@archlinux.net>
pkgname=tegaki-models-zinnia-traditional-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Simplified Chinese handwriting models for zinnia engine and use in Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('zinnia>=0.05')
optdepends=('tegaki-recognize: Chinese and Japanese Handwriting Recognition program')
source=("https://github.com/tegaki/tegaki/releases/download/v$pkgver/tegaki-zinnia-traditional-chinese-$pkgver.zip")
sha256sums=('f41032e67a4eff056813d243eabc32ea07eea404c714bdb5882a5b0fcda51690')

package() {
  cd "$srcdir/tegaki-zinnia-traditional-chinese-$pkgver"
  mkdir -p "$pkgdir/usr/share/tegaki/models/zinnia"
  install -D -m644 $srcdir/tegaki-zinnia-traditional-chinese-$pkgver/handwriting-zh_TW.meta $pkgdir/usr/share/tegaki/models/zinnia/
  install -D -m644 $srcdir/tegaki-zinnia-traditional-chinese-$pkgver/handwriting-zh_TW.model $pkgdir/usr/share/tegaki/models/zinnia/
}
