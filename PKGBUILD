# Maintainer: veyen <veyen33@gmail.com>

pkgname=ttf-tuladha
pkgver=2.01
pkgrel=1
pkgdesc="Tuladha Jejeg TTF font for Javanese script"
arch=(any)
depends=(fontconfig xorg-font-utils)
makedepends=('libarchive')
source=(https://sites.google.com/site/jawaunicode/TuladhaJejegGr_$pkgver.zip)
url="https://sites.google.com/site/jawaunicode/"
license=('SIL OFL')
install=$pkgname.install
sha256sums=('353bf596d5b000096b72909c04f29f495de59a1a44b3f48abe0c8d00032fd670' )

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 OFL.txt OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname"
}
