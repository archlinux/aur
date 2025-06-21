# Maintainer: Luna Present <code at lunapresent dot net>

_name=lrxed
pkgname=$_name-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A tui application for synchronising lyrics"
arch=("x86_64")
url="https://github.com/LunaPresent/$_name"
license=("EUPL-1.2")
provides=("$_name")
conflicts=("$_name")
depends=("gcc-libs" "alsa-lib")
source=("$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("8dc5cc2ac5b4fb605f40ac9fc30c2444e2dbbad02b0a8feda1236e7234677955")

package() {
  install -Dm755 "$_name" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_name"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
