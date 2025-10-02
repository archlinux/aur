# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=godap-bin
_pkgname="${pkgname%-bin}"
pkgver=v2.10.6
pkgrel=1
pkgdesc="A complete TUI for LDAP."
arch=('x86_64')
url="https://github.com/Macmod/godap"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
sha512sums=('ce7be7bc581489ad5b4ee32b919658cabfdb3eaa46777ef236f1660c696fbf97e48b55b58d95652c7b9d086fb7d0e0cb5854c82655ce16ce5fad212272b97da0')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}

