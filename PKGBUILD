# Maintainer: Robin Candau <robincandau at protonmail dot com>
pkgname=malias
pkgver=1.1
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases."
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=(3009004ced8a616da8100981c6d507a0827ba0a97bc11f8ed63f2e1f22b037d1)

package() {
  
  cd "$srcdir"

  install -Dm 755 "bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 "man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
