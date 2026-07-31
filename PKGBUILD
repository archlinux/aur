# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=godap-bin
_pkgname="${pkgname%-bin}"
pkgver=v2.11.1
pkgrel=1
pkgdesc="A complete TUI for LDAP."
arch=('x86_64')
url="https://github.com/Macmod/godap"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
sha512sums=('2914f0222bd8c09c218852e4591505dc8e120f30ca1bfa7ee1a36c7282e7abea58b67ee024dddc5ea59be2a6cef16b1adc68892d7ad5236f0a3279e1cffb0c03')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}

