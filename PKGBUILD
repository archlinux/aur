# Maintainer: Félix Saparelli <aur@passcod.name>

_name=certainly
pkgname="$_name-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="The easiest way to create self-signed certificates. Ever."
url='https://github.com/passcod/certainly'
arch=('x86_64')
license=('Artistic-2.0')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
sha512sums=('6d910c3f4fad9ad9cc223e34a27c97b75a53c46ec9ad59f6b4f7ca8eb36afa66b252fc3711b5ccbd85dba08b8702fbe7d4c2f5234ee925764e4ba251e5d3c4d0')

package() {
  cd "$_name-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
  install -Dm644 "$_name.1" "$pkgdir/usr/share/man/man1/$_name.1"
}

