# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
# _url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
_url="$url/releases/download/v$pkgver-rc1/${_name}_${pkgver}-rc1_Linux"
source_x86_64=("${_url}_x86_64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_i386.tar.gz")
sha256sums_x86_64=('8a0f2a69fe7e38794ff58ae393b12f59f9c96d1b9b5e24d8b0da22a7eceeb94e')
sha256sums_arm64=('8f2f1105f369ce0a3b634dc30862b026906f1aa55d445c378f42fd062ed43a60')
sha256sums_i386=('4483525af76ddb37a812e6333e84bc2e37f1cd4700d640221622ff0253c5ae4f')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
