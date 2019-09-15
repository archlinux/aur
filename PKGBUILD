# Maintainer: Félix Saparelli <aur@passcod.name>

_name=certainly
pkgname="$_name-bin"
pkgver=1.7.0
pkgrel=1
pkgdesc="The easiest way to create self-signed certificates. Ever."
url='https://github.com/passcod/certainly'
arch=('x86_64')
license=('Artistic-2.0')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")

package() {
  cd "$_name-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
  install -Dm644 "$_name.1" "$pkgdir/usr/share/man/man1/$_name.1"
}

sha512sums=('6204b63291866a463e874c5c9a23ad3d8809ad59d668251ea20ed6934f61c248f23cb9fa6fffad46fdda2f3a7322d1219deaf8108f271b74bc26f6a45300bd0a')
