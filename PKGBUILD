# Maintainer: Félix Saparelli <aur@passcod.name>

_name=certainly
pkgname="$_name-bin"
pkgver=1.8.0
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

sha512sums=('09d3fcc7257b691fc41c33a77e2f28d8bf44d3d03dffa390b2e2fa839b8f323a303a91aa24538766cd3e062e970295e9f140421e2fa4b8eee501f39dd9dea714')
