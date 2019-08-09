# Maintainer: Daniel Kronberg <danikron at protonmail dot com>
pkgname=otf-font-awesome-5-free
pkgver=5.10.1
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v$pkgver/fontawesome-free-$pkgver-desktop.zip")
sha256sums=('82a706af092a8c494f2ef516966993fb2721acd1995304907f41a356d701e8ba')

package() {
  cd "fontawesome-free-$pkgver-desktop"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
