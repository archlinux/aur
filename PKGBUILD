# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=godap-bin
_pkgname="${pkgname%-bin}"
pkgver=v2.10.1
pkgrel=1
pkgdesc="A complete TUI for LDAP."
arch=('x86_64')
url="https://github.com/Macmod/godap"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
sha512sums=('601b8181dcda18e994c807af21bf555d667c908417d951e8973702370d7071a4a3b1cdfc9a88fc641c1abea5ded7eaa1fed77fd17e30a39d92f71300e1933d8e')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

