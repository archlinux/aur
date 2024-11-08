# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=godap-bin
_pkgname="${pkgname%-bin}"
pkgver=v2.8.0
pkgrel=1
pkgdesc="A complete TUI for LDAP."
arch=('x86_64')
url="https://github.com/Macmod/godap"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
sha512sums=('0198ca5088d640b9d4a1ea8516acea728d6ae408a9f2075045d97dac47bcfe6902825d5e1a3c38c5e9c5b0f65bbe678cd8e9b08d8ee84099b8cd899d74a1616f')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

