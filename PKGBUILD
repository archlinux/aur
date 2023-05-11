# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-slstatus
pkgver=1.0.0
pkgrel=1
pkgdesc="A suckless status monitor for archy linux"
url="https://github.com/archy-linux/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=()
install=
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/archy-linux/$pkgname/archive/refs/tags/$pkgname_$pkgver.tar.gz")
sha256sums=('d7414e26f06ee565337791d75a502760a00ebff46319be636c150a3c3d78275d')

package() {
  cd "$pkgname_$pkgver" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
