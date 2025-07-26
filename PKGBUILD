# Maintainer: Luna Present <code at lunapresent dot net>

_name=lrxed
pkgname=$_name-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A tui application for synchronising lyrics"
arch=("x86_64" "aarch64")
url="https://github.com/LunaPresent/$_name"
license=("EUPL-1.2")
provides=("$_name")
conflicts=("$_name")
depends=("gcc-libs" "alsa-lib")
source_x86_64=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_name-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=("dcf4a2a7ecab33fbdde57af5f9b9d7a8f8e505c3da021685cff3e3995d59aedb")
sha256sums_aarch64=("69a5b7e962ef86c1ef84d55cee106f66a214059b055e345800e59bfd639253da")

package() {
  install -Dm755 "$_name" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_name"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
