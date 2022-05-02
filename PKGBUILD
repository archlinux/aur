# Maintainer: Robin Candau <robincandau at protonmail dot com>
pkgname=malias
pkgver=1.0
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases."
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=(933e6f6ad1429558e194d4cfe85c19a53c7e71e5f74851e7762dfa6e87bb3356)

package() {
  
  cd "$srcdir"

  install -Dm 755 "bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm 755 "bin/$pkgname-add.sh" "$pkgdir/usr/bin/$pkgname-add"
  install -Dm 755 "bin/$pkgname-list.sh" "$pkgdir/usr/bin/$pkgname-list"
  install -Dm 755 "bin/$pkgname-delete.sh" "$pkgdir/usr/bin/$pkgname-delete"

  install -Dm 644 "man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
