# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tcalc
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple calculator written in core Tcl/Tk"
url="https://github.com/thanoulis/$pkgname"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bba48c03c0369dfe4593aea79920cece4b4565625f5da194b05cff3b516532c5')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
