# Maintainer: Félix Saparelli <aur@passcod.name>

_name=certainly
pkgname="$_name-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="The easiest way to create self-signed certificates. Ever."
url='https://github.com/passcod/certainly'
arch=('x86_64')
license=('Artistic-2.0')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
sha512sums=('aa63b3c05e48b75c858c46755ce6afb0185933cc62997ae5c78a9ae9945788413a293d5927900f7c846c19d7fab19362c61ac1fc972a8b84ec0f3e54bd373454')

package() {
  cd "$_name-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
  install -Dm644 "$_name.1" "$pkgdir/usr/share/man/man1/$_name.1"
}

