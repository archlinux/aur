# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=cleanlib32
pkgver=0.2
pkgrel=1
pkgdesc="Remove unneeded lib32 packages from your Arch Linux system."
arch=(x86_64)
url="https://github.com/josephgbr/cleanlib32"
license=('GPL3')
depends=('bash')
optdepends=('sudo: execute cleanlib32 as normal user with root permissions')
source=("$url/releases/$pkgver/423/$pkgname-$pkgver.tar.xz")
md5sums=('3e735ea002218ef1fb53e714cd6c5c96')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

