# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=tegaki-models-zinnia-japanese
pkgver=0.3
pkgrel=3
pkgdesc="Japanese handwriting models for zinnia engine and use in Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('zinnia>=0.05')
optdepends=('tegaki-recognize: Chinese and Japanese Handwriting Recognition program')
source=("https://github.com/tegaki/tegaki/releases/download/v$pkgver/tegaki-zinnia-japanese-$pkgver.zip")
md5sums=('19c2ed9e770c23016f788b06ade41f95')

package() {
  cd "$srcdir/tegaki-zinnia-japanese-$pkgver"
  mkdir -p "$pkgdir/usr/share/tegaki/models/zinnia"
  install -D -m644 $srcdir/tegaki-zinnia-japanese-$pkgver/handwriting-ja.meta $pkgdir/usr/share/tegaki/models/zinnia/
  install -D -m644 $srcdir/tegaki-zinnia-japanese-$pkgver/handwriting-ja.model $pkgdir/usr/share/tegaki/models/zinnia/
}
