# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tedit
pkgver=1.7.8
pkgrel=1
pkgdesc="Simple text editor written in TCL/TK"
url="https://github.com/thanoulis/tedit"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c44516b6e2f59622c663f05f2ad38dc5cb962bd83f4f1eff8b885e3d9e2a6bb9')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
