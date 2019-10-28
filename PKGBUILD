# Maintainer: navigaid <navigaid@gmail.com>
pkgname=arch-bootstrap
pkgver=0.1
pkgrel=1
pkgdesc="Bootstrap a base Arch Linux system"
arch=('x86_64')
url="https://github.com/btwiuse/arch-bootstrap"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/btwiuse/$pkgname/archive/v$pkgver.tar.gz")
makedepends=()
md5sums=('ae2181f10cc68a37842879b5fcf21670')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
