# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tclip
pkgver=0.4.4
pkgrel=1
pkgdesc="Simple clipboard manager written in TCL/TK"
url="https://github.com/thanoulis/$pkgname"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('06b7d4f1bcf19eb7b57a31e5991b876a350f5385232b588de89f27f26d680a03')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
