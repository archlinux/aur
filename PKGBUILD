# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=tegaki-models-zinnia-simplified-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Simplified Chinese handwriting models for zinnia engine and use in Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('zinnia>=0.05')
optdepends=('tegaki-recognize: Chinese and Japanese Handwriting Recognition program')
source=("https://github.com/tegaki/tegaki/releases/download/v$pkgver/tegaki-zinnia-simplified-chinese-$pkgver.zip")
sha256sums=('45bb61a9a5e1ff571de9ac0711c316f29a064260feea6f5db6979ecd980498a3')

package() {
  cd "$srcdir/tegaki-zinnia-simplified-chinese-$pkgver"
  mkdir -p "$pkgdir/usr/share/tegaki/models/zinnia"
  install -D -m644 $srcdir/tegaki-zinnia-simplified-chinese-$pkgver/handwriting-zh_CN.meta $pkgdir/usr/share/tegaki/models/zinnia/
  install -D -m644 $srcdir/tegaki-zinnia-simplified-chinese-$pkgver/handwriting-zh_CN.model $pkgdir/usr/share/tegaki/models/zinnia/
}
