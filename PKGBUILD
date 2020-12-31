# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tpmg
pkgver=0.7.2
pkgrel=1
pkgdesc="Zenity/kdialog replacement written in TCL/TK"
url="https://github.com/thanoulis/$pkgname"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('44bf7b366406aace77b601c75506494aebaf432366468bc85d22dd9590ca0ab8')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
