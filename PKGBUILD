# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
source_x86_64=("${_url}_x86_64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_i386.tar.gz")
sha256sums_x86_64=('192863f615583a9f74fb7c64b5eaeee17337a8a29ebcb0756e65d77be0a8d502')
sha256sums_arm64=('0f8f9ab5b6c2e2027eba415ef6ceb9801fe40aa8216529994afa811654b2beb4')
sha256sums_i386=('9c980d2aef32125b22c5e9ea5be8b6f96745856c69797793f4d69a1ab1d7d927')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
