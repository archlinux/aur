# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tqemu
pkgver=1.0.2
pkgrel=2
pkgdesc="QEMU frontend without libvirt (GitHub)"
url="https://github.com/thanoulis/$pkgname"
arch=('any')
license=('custom')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('812f96e86c5a8d6441123ff1e72d18e91fe6e8b04136d3ed85228b11d80a998b')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
