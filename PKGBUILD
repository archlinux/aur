# Maintainer: Daniel Kronberg <danikron at protonmail dot com>
pkgname=otf-font-awesome-5-free
pkgver=5.8.1
pkgrel=2
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v$pkgver/fontawesome-free-$pkgver-desktop.zip")
sha256sums=('888f7ff14cfbd31d4ae1e59a65f1037ed0c5460ba2a9480cda1d7d454ed31e16')

package() {
  cd "fontawesome-free-$pkgver-desktop"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
