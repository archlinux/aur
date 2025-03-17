# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=stigmerge-bin
_pkgname="${pkgname%-bin}"
_conf_pkg="distrans"
pkgver=v0.3.19
pkgrel=1
pkgdesc="Stigmergic merging of files over Veilid. Killab33z on the swarm."
arch=('x86_64')
url="https://github.com/cmars/stigmerge"
license=('MPL-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/${_conf_pkg}_cli-$pkgver/${_conf_pkg}_cli-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('2a27bcd306f18eddcdb064601c6edd8b44293be802ba18c09dc1aca824617bd3d5a9f790339a329470bbba9068975866dbd375655fbb69e795127a5b84864a61')

package() {
  install -Dm0755 $srcdir/${_conf_pkg}_cli-$arch-unknown-linux-gnu/$_conf_pkg "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 $srcdir/${_conf_pkg}_cli-$arch-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

