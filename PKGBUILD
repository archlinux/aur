# Maintainer: Torin <torin.cbennun@googlemail.com>

pkgname=ttf-sabilulungan-sundanese
pkgver=1.0.5
pkgrel=1
pkgdesc="Sabilulungan TTF font for Sundanese script"
arch=(any)
url="http://sabilulungan.org/aksara/"
license=('GPL')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=(http://sabilulungan.org/aksara/files/font/SundaneseUnicode-$pkgver.ttf)
sha256sums=('f1dd66a1db30b3af2d0604778be3a5c2890feeb1d06e4acf0a94b9e3fbb520b2')

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
