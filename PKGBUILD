# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tcalc
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple calculator written in core Tcl/Tk"
url="https://github.com/thanoulis/$pkgname"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e4a48c9b66ac06ec638a459e6227596252677b3e98166435d382cf84329e365')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
