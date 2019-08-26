pkgname=otf-font-awesome-5-free
pkgver=5.10.2
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v$pkgver/fontawesome-free-$pkgver-desktop.zip")
sha256sums=('351aeaf4d4e702bdcb6ab0d1262cd28c20ab7ba5bbea6494e2fb0d79a1d94bf8')

package() {
  cd "fontawesome-free-$pkgver-desktop"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
