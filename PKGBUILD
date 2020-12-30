# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tedit
pkgver=1.7.7
pkgrel=1
pkgdesc="Simple text editor written in TCL/TK"
url="https://github.com/thanoulis/tedit"
arch=('any')
license=('GPL')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver")
sha256sums=('333e076c5ec5925aafcc1c33bb3448383db9869261f499119009bf05c2af688a')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
