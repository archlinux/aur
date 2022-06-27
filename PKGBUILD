# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=malias
pkgver=1.2.0
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases."
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=($url/archive/v$pkgver.tar.gz)
sha256sums=(72d1ecd32f0136a83c03495b14be924f470a7da2ab04fd646540e17824c2ad86)

package() {

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 "src/bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 "src/man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
