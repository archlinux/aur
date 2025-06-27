# Maintainer: Luna Present <code at lunapresent dot net>

_name=lrxed
pkgname=$_name-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A tui application for synchronising lyrics"
arch=("x86_64" "aarch64")
url="https://github.com/LunaPresent/$_name"
license=("EUPL-1.2")
provides=("$_name")
conflicts=("$_name")
depends=("gcc-libs" "alsa-lib")
source_x86_64=("$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_name-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("4c744eeef8eef324632624cc4b5e381b4046f25e4a0c46aeba28a6cf6d19323b")
sha256sums_aarch64=("9053a2c5e164bfe026d684d49072e61129cf9c936c17b65d86fb9c837314deeb")

package() {
  install -Dm755 "$_name" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_name"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
