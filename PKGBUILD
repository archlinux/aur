# Maintainer: Félix Saparelli <aur@passcod.name>

_name=certainly
pkgname="$_name-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="The easiest way to create self-signed certificates. Ever."
url='https://github.com/passcod/certainly'
arch=('x86_64')
license=('Artistic-2.0')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
sha512sums=('69adffeb1d01c2239e8c10eb284d807ba21bfe3ea527aebae9675cf52ea3a61966a41ad4fa0d9ceb1c46603236fcf44e2b5c1440be0b010b9faf06a9d5edd1f8')

package() {
  cd "$_name-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
  install -Dm644 "$_name.1" "$pkgdir/usr/share/man/man1/$_name.1"
}

