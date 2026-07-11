# Maintainer: iqzer0 <aaish@ifrid.org>
pkgname=dhivehifonts
pkgver=1.0.0
pkgrel=1
pkgdesc="Curated collection of 193 free Unicode Dhivehi (Thaana) fonts"
arch=('any')
url="https://github.com/iqzer0/dhivehifonts"
license=('OFL-1.1' 'LicenseRef-Freeware')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8eb844b087aa1d9ee24cf88652c2a69f9c7c485629dbf32da457a4c1aa40d02a')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/fonts/$pkgname"
  install -m644 fonts/*.ttf fonts/*.otf "$pkgdir/usr/share/fonts/$pkgname/"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
