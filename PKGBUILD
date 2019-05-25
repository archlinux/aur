# Maintainer: Daniel Kronberg <danikron at protonmail dot com>
pkgname=otf-font-awesome-5-free
pkgver=5.8.2
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v$pkgver/fontawesome-free-$pkgver-desktop.zip")
sha256sums=('e0ae4ab1084b76eea25a75ddd6239f9f277ad8eb85b1d4c011e396e460ed5109')

package() {
  cd "fontawesome-free-$pkgver-desktop"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
